import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/chat/widgets/chat_search.dart';
import 'package:upgrade_traine_project/features/profile/presentation/state_m/cubit/profile_cubit.dart';

import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/ui/widgets/custom_text.dart';
import '../data/model/chat_model.dart';
import '../data/model/message_model.dart';
import 'chat_details_view.dart';

class ChatView extends StatefulWidget {
  ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getTrainers();
    super.initState();
  }

  final Stream<QuerySnapshot<Map<String, dynamic>>> chatsCollection =
      FirebaseFirestore.instance.collection('chats').snapshots();

  horizontalListView() {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetTrainersSuccess) {
          return SizedBox(
            height: 120.h,
            child: ListView.builder(
                itemCount: state.trainersModel.result!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _goToChat(context, state, index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          image: state.trainersModel.result![index].imageUrl ==
                                  null
                              ? DecorationImage(
                                  image: AssetImage(AppConstants.COACH1_IMAGE),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: NetworkImage(
                                    state.trainersModel.result![index]
                                            .imageUrl ??
                                        "",
                                  ),
                                  fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                                text: state.trainersModel.result![index].name ??
                                    "",
                                fontWeight: FontWeight.w700,
                                fontSize: AppConstants.textSize10),
                            // CustomText(
                            //   text: "متدرب كورس أثقال",
                            //   fontWeight: FontWeight.w700,
                            //   fontSize: AppConstants.textSize10,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      listener: (context, state) {},
    );
  }

  void _goToChat(BuildContext context, GetTrainersSuccess state, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatDetailsView(
              chatModel: ChatModel(
            traineeId:
                BlocProvider.of<ProfileCubit>(context).profileModel!.result!.id,
            trainerId: state.trainersModel.result![index].id,
            trainerName: state.trainersModel.result![index].name ?? "",
            trainerImage: state.trainersModel.result![index].imageUrl,
          )),
        ));
  }

/*
  verticalListView() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: chatsCollection,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Text('Something went wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<ChatModel> chats = [];
          for (var element in snapshot.data!.docs) {
            if (element.data()["traineeId"] ==
                BlocProvider.of<ProfileCubit>(context)
                    .profileModel!
                    .result!
                    .id) {
              chats.add(ChatModel.fromJson(element.data()));
            }
          }

          return Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChatDetailsView(chatModel: chats[index]),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 90.h,
                          child: Row(
                            children: [
                              Container(
                                width: 80.w,
                                height: 95.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.h),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      chats[index].trainerImage ?? "",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(
                                    text: chats[index].trainerName ?? "",
                                    fontSize: AppConstants.textSize18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('chats')
                                        .doc(BlocProvider.of<ProfileCubit>(
                                                    context)
                                                .profileModel!
                                                .result!
                                                .id
                                                .toString() +
                                            chats[index].trainerId.toString())
                                        .collection("messages")
                                        .orderBy("messageTime",
                                            descending: true)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.active) {
                                        MessageModel message =
                                            MessageModel.fromJson(snapshot
                                                .data!.docs.last
                                                .data());
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (message.type == "message")
                                              Expanded(
                                                child: CustomText(
                                                  textAlign: TextAlign.start,
                                                  text: message.message ?? "",
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize:
                                                      AppConstants.textSize14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            if (message.type == "file")
                                              Expanded(
                                                child: CustomText(
                                                  textAlign: TextAlign.start,
                                                  text: "image",
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize:
                                                      AppConstants.textSize14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            CustomText(
                                              text: message.messageTime!
                                                  .substring(0, 10),
                                              fontSize: AppConstants.textSize14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey,
                                            ),
                                          ],
                                        );
                                      } else if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const SizedBox();
                                      }
                                      return const SizedBox();
                                    },
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: AppColors.white,
                    );
                  },
                  itemCount: chats.length));
        }
      },
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
          title: LanguageHelper.tr(context).need_chat_with_your_trainer),
      body: Column(
        children: [
          horizontalListView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: AppColors.white,
            ),
          ),
          SearchContainer()
        ],
      ),
    );
  }
}
