// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/chat/widgets/agora_actions.dart';
import 'package:upgrade_traine_project/features/chat/widgets/chat_messages.dart';
import 'package:upgrade_traine_project/features/notification/presentation/controller/notification_cubit.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../core/common/app_colors.dart';
import '../../profile/presentation/state_m/cubit/profile_cubit.dart';
import '../data/model/chat_model.dart';

class ChatDetailsView extends StatefulWidget {
  final ChatModel? chatModel;

  const ChatDetailsView({Key? key, this.chatModel}) : super(key: key);

  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  final messageController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  Future<void> sendMessage() async {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(BlocProvider.of<ProfileCubit>(context)
                .profileModel!
                .result!
                .id
                .toString() +
            widget.chatModel!.trainerId.toString())
        .set({
      "traineeId":
          BlocProvider.of<ProfileCubit>(context).profileModel!.result!.id,
      "traineeImage": BlocProvider.of<ProfileCubit>(context)
              .profileModel!
              .result!
              .imageUrl ??
          "",
      "traineeName":
          BlocProvider.of<ProfileCubit>(context).profileModel!.result!.name,
      "trainerId": widget.chatModel!.trainerId,
      "trainerImage": widget.chatModel!.trainerImage ?? "",
      "trainerName": widget.chatModel!.trainerName ?? "",
      "id": BlocProvider.of<ProfileCubit>(context)
              .profileModel!
              .result!
              .id
              .toString() +
          widget.chatModel!.trainerId.toString(),
    });
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(BlocProvider.of<ProfileCubit>(context)
                .profileModel!
                .result!
                .id
                .toString() +
            widget.chatModel!.trainerId.toString())
        .collection("messages")
        .doc()
        .set({
      "message": messageController.text,
      "senderId":
          BlocProvider.of<ProfileCubit>(context).profileModel!.result!.id,
      "receiverId": widget.chatModel!.trainerId,
      "messageTime": DateTime.now().toString(),
      "type": "message"
    });
    BlocProvider.of<NotificationCubit>(context)
        .createNotifications(context, widget.chatModel!.trainerId!, 0);
  }

  Future<void> _uploadImage(File image) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('Images')
        .child(image.path.split("/").last);
    UploadTask uploadTask = storageReference.putFile(image);

    await Future.value(uploadTask);

    var newUrl = await storageReference.getDownloadURL();

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(BlocProvider.of<ProfileCubit>(context)
                .profileModel!
                .result!
                .id
                .toString() +
            widget.chatModel!.trainerId.toString())
        .collection("messages")
        .doc()
        .set({
      "message": newUrl,
      "senderId":
          BlocProvider.of<ProfileCubit>(context).profileModel!.result!.id,
      "receiverId": widget.chatModel!.trainerId,
      "messageTime": DateTime.now().toString(),
      "type": "file"
    });
    BlocProvider.of<NotificationCubit>(context)
        .createNotifications(context, widget.chatModel!.trainerId!, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(title: LanguageHelper.tr(context).chat),
      body: Column(
        children: [
          AgoraActionsWidget(widget.chatModel!),
          chatText(context, widget.chatModel!.trainerId!),
          Container(
              decoration: BoxDecoration(
                  color: AppColors.transparent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      if (messageController.text.isNotEmpty) {
                        await sendMessage();
                      }
                      messageController.clear();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.paperPlane,
                      color: AppColors.white,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.white),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter text here',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    ),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () async {
                          var file = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (file != null) {
                            _uploadImage(File(file.path));
                          }
                        },
                        icon: const Icon(
                          FontAwesomeIcons.paperclip,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
