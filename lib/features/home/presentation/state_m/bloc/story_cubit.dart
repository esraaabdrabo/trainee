import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/features/home/data/repository/story_repo.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/home_cubit.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/story_state.dart';

import '../../../../../core/ui/toast.dart';
import '../../../data/model/request/get_stories_request.dart';
import '../provider/explore_screen_notifier.dart';

class StoryCubit extends Cubit<StoryStates> {
  StoryCubit() : super(StoryInitialState());

  final _storyRepo = StoryRepo();

  String? img;

  Future uploadImage(BuildContext context, File file) async {
    emit(UploadImageLoading());
    final res = await _storyRepo.uploadImage(file);
    res.fold(
      (err) {
        Toast.show(err);
        emit(UploadImageError());
      },
      (res) async {
        img = res;
        uploadStory(context);
        emit(UploadImageLoaded());
      },
    );
  }

  Future uploadStory(
    BuildContext context,
  ) async {
    emit(UploadStoryLoading());
    final res = await _storyRepo.uploadStory(img!);
    res.fold(
      (err) {
        Toast.show(err);
        emit(UploadStoryError());
      },
      (res) {
        print(res);
        Provider.of<ExploreScreenNotifier>(context, listen: false)
            .homeCubit
            .getStories(GetStoriesRequest(
                skipCount:
                    Provider.of<ExploreScreenNotifier>(context).dataFetched));
        emit(UploadStoryLoaded());
      },
    );
  }
}
