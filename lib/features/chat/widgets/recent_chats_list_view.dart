import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/features/chat/data/model/chat_model.dart';
import 'package:upgrade_traine_project/features/chat/data/model/message_model.dart';
import 'package:upgrade_traine_project/features/chat/screen/chat_details_view.dart';
import 'package:upgrade_traine_project/features/profile/presentation/state_m/cubit/profile_cubit.dart';

const String defaultAvatar =
    "https://minervastrategies.com/wp-content/uploads/2016/03/default-avatar.jpg";

class RecentChatsListView extends StatefulWidget {
  const RecentChatsListView({super.key});

  @override
  State<RecentChatsListView> createState() => _RecentChatsListViewState();
}

class _RecentChatsListViewState extends State<RecentChatsListView> {
  final Stream<QuerySnapshot<Map<String, dynamic>>> chatsCollection =
      FirebaseFirestore.instance.collection('chats').snapshots();
  @override
  Widget build(BuildContext context) {
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

          return ListView.separated(
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: chats[index].trainerName ?? "",
                                fontSize: AppConstants.textSize18,
                                fontWeight: FontWeight.w600,
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('chats')
                                    .doc(BlocProvider.of<ProfileCubit>(context)
                                            .profileModel!
                                            .result!
                                            .id
                                            .toString() +
                                        chats[index].trainerId.toString())
                                    .collection("messages")
                                    .orderBy("messageTime", descending: true)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    MessageModel message =
                                        MessageModel.fromJson(
                                            snapshot.data!.docs.last.data());
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
                                              fontSize: AppConstants.textSize14,
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
                                              fontSize: AppConstants.textSize14,
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
              itemCount: chats.length);
        }
      },
    );
  }
}

//show search result here
class ChatSummaryWidget extends StatelessWidget {
  final ChatModel chat;
  const ChatSummaryWidget(this.chat, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailsView(chatModel: chat),
          )),
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
                      chat.traineeImage == null || chat.traineeImage!.isEmpty
                          ? defaultAvatar
                          : chat.trainerImage!,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: chat.trainerName ?? "",
                    fontSize: AppConstants.textSize18,
                    fontWeight: FontWeight.w600,
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('chats')
                        .doc(chat.traineeId.toString() +
                            BlocProvider.of<ProfileCubit>(context)
                                .profileModel!
                                .result!
                                .id
                                .toString())
                        .collection("messages")
                        .orderBy("messageTime", descending: false)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        MessageModel message = MessageModel.fromJson(
                            snapshot.data!.docs.last.data());
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (message.type == "message")
                              Expanded(
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  text: message.message ?? "",
                                  textOverflow: TextOverflow.ellipsis,
                                  fontSize: AppConstants.textSize14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            if (message.type == "file")
                              Expanded(
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  text: "image",
                                  textOverflow: TextOverflow.ellipsis,
                                  fontSize: AppConstants.textSize14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            CustomText(
                              text: message.messageTime!.substring(0, 10),
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
  }
}
