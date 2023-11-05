// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import '../../../core/utils/validators/error_image.dart';
import '../../profile/presentation/state_m/cubit/profile_cubit.dart';
import '../data/model/message_model.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

chatText(BuildContext context, int trainerId) {
  return StreamBuilder(
    stream: _getMessages(context, trainerId),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Expanded(
            child: Center(child: CircularProgressIndicator()));
      } else {
        List<MessageModel> messages = [];
        for (var element in snapshot.data!.docs) {
          messages.add(MessageModel.fromJson(element.data()));
        }
        return messages.isEmpty
            ? _NoDataWidget()
            : Expanded(
                child: ListView.separated(
                    reverse: true,
                    itemBuilder: (context, index) {
                      if (messages[index].senderId ==
                          BlocProvider.of<ProfileCubit>(context)
                              .profileModel!
                              .result!
                              .id) {
                        if (messages[index].type == "message") {
                          return ChatBubble(
                            clipper:
                                ChatBubbleClipper1(type: BubbleType.sendBubble),
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.only(top: 20),
                            backGroundColor: Colors.blue,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                messages[index].message ?? "",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } else {
                          return ChatBubble(
                            clipper:
                                ChatBubbleClipper1(type: BubbleType.sendBubble),
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.only(top: 20),
                            backGroundColor: Colors.blue,
                            child: Image.network(
                                errorBuilder: (context, error, stackTrace) {
                              return const ErrorImage();
                            },
                                height: 200,
                                width: MediaQuery.of(context).size.width * 0.7,
                                fit: BoxFit.cover,
                                messages[index].message ?? ""),
                          );
                        }
                      } else {
                        if (messages[index].type != "file") {
                          return ChatBubble(
                            clipper: ChatBubbleClipper1(
                                type: BubbleType.receiverBubble),
                            backGroundColor: const Color(0xffE7E7ED),
                            margin: const EdgeInsets.only(top: 20),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                messages[index].message ?? "",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        } else {
                          return ChatBubble(
                            clipper: ChatBubbleClipper1(
                                type: BubbleType.receiverBubble),
                            backGroundColor: const Color(0xffE7E7ED),
                            margin: const EdgeInsets.only(top: 20),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Image.network(
                                errorBuilder: (context, error, stackTrace) {
                                  return const ErrorImage();
                                },
                                messages[index].message ?? "",
                              ),
                            ),
                          );
                        }
                      }
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: messages.length));
      }
    },
  );
}

class _NoDataWidget extends StatelessWidget {
  const _NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
        child:
            CustomText(text: LanguageHelper.tr(context).no_data_found),
      ));
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> _getMessages(
    BuildContext context, int trainerId) {
  return FirebaseFirestore.instance
      .collection('chats')
      .doc(_getDocName(context, trainerId))
      .collection("messages")
      .orderBy("messageTime", descending: true)
      .snapshots();
}

String _getDocName(BuildContext context, int trainerId) {
  return BlocProvider.of<ProfileCubit>(context)
          .profileModel!
          .result!
          .id
          .toString() +
      trainerId.toString();
}
