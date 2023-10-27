import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/story_cubit.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/story_state.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/session_data.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../generated/l10n.dart';
import '../../../notification/presentation/view/notification_screen.dart';
import '../../data/model/request/get_stories_request.dart';
import '../../data/model/request/get_story_request.dart';
import '../../domain/entity/story_entity.dart';
import '../screen/../state_m/provider/explore_screen_notifier.dart';
import '../state_m/bloc/home_cubit.dart';
import 'explore_screen_content.dart';

class ExploreScreen extends StatefulWidget {
  static const String routeName = "/ExploreScreen";
  const ExploreScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final sn = ExploreScreenNotifier();
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExploreScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).welcome,
          actions: [
            BlocProvider(
              create: (context) => StoryCubit(),
              child: BlocBuilder<StoryCubit,StoryStates>(builder: (context, state) {
                return InkWell(
                  onTap: ()async{
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            content: const Text("choose image source",style: TextStyle(color: Colors.black),),
                            actions: [
                              TextButton(
                                child: const Text("camera",style: TextStyle(color: Colors.black),),
                                onPressed: ()async{
                                  var file = await _picker.pickImage(source: ImageSource.camera);
                                  if(file != null){
                                    Navigator.pop(context);
                                    await BlocProvider.of<StoryCubit>(context).uploadImage(context, File(file.path));
                                    // BlocProvider.of<StoryCubit>(context).uploadStory(context,);
                                  }

                                },
                              ),
                              TextButton(
                                child: const Text("gallery",style: TextStyle(color: Colors.black),),
                                onPressed: ()async{
                                  var file = await _picker.pickImage(source: ImageSource.gallery);
                                  if(file != null){
                                    Navigator.pop(context);
                                    await BlocProvider.of<StoryCubit>(context).uploadImage(context, File(file.path));

                                    // await BlocProvider.of<StoryCubit>(context).uploadStory(context,);
                                  }
                                },
                              ),
                            ]
                        ));

                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                );
              },),
            ),
            Gaps.hGap20,
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocListener<HomeCubit, HomeState>(
            bloc: sn.homeCubit,
            listener: (context, state) {
              state.mapOrNull(
                homeInitState: (value) {
                  sn.loading = true;
                },
                homeLoadingState: (value) {
                  sn.loading = true;
                },
                homeErrorState: (value) {
                  sn.loading = false;
                },
                getStoryState: (value) {
                  sn.loading = false;
                  StoryEntity temp = StoryEntity(
                    id: value.storyEntity.id,
                    storyImages: value.storyEntity.storyImages,
                    userId: value.storyEntity.userId,
                    user: value.storyEntity.user,
                    creationTime: value.storyEntity.creationTime,
                    description: value.storyEntity.description,
                    isShared: true,
                  );
                  sn.addToStories([temp]);
                },
                getSpecializationsState: (value) {},
                getStoriesState: (value) {
                  if (value.storiesEntity.items != null &&
                      value.storiesEntity.items!.isNotEmpty) {
                    setState(() {
                      sn.addToStories(value.storiesEntity.items!);
                    });
                  } else if (sn.isFirstRequest) {
                    sn.isEmpty = true;
                  } else {
                    sn.loading = false;
                    sn.carouselController.previousPage(curve: Curves.ease);
                  }
                  sn.isFirstRequest = false;
                },
              );
              /*
              state.whenOrNull(
                homeLoadingState: () {
                  print('llloading');
                  setState(() {
                    sn.loading = true;
                  });
                },
                getStoriesState: (storiesEntity) {
                  print('llldata');
                  if (storiesEntity.items != null &&
                      storiesEntity.items!.length != 0)
                    setState(() {
                      sn.addToStories(storiesEntity.items!);
                    });
                },
              );*/
            },
            child: ExploreScreenContent()),
      ),
    );
  }

  void _init() async {
    if (Provider.of<SessionDataProvider>(context, listen: false)
            .sharedStoryId ==
        null) {
      sn.homeCubit.getStories(GetStoriesRequest());
      sn.addToStories(
          [StoryEntity(id: ExploreScreenNotifier.LOADING_WIDGET_ID)],
          isLoading: true);
    } else {
      print('uriii3 ${Provider.of<SessionDataProvider>(context, listen: false)
              .sharedStoryId!}');
      sn.homeCubit.getStory(GetStoryRequest(
          id: int.parse(Provider.of<SessionDataProvider>(context, listen: false)
              .sharedStoryId!)));
      sn.addToStories(
          [StoryEntity(id: ExploreScreenNotifier.LOADING_WIDGET_ID)],
          isLoading: true);

      Provider.of<SessionDataProvider>(context, listen: false).sharedStoryId =
          null;
    }
  }
}
