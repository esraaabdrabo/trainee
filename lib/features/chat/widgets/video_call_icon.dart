import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/video_call_screen.dart';
import 'package:upgrade_traine_project/features/notification/presentation/controller/notification_cubit.dart';

class VideoCallIcon extends StatelessWidget {
  final int id;
  final String channelName;
  const VideoCallIcon(this.id, this.channelName, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _sendNotification(context);
          _goToVideoCallScreen(context);
        },
        icon: const Icon(
          Icons.videocam,
          color: AppColors.accentColorLight,
        ));
  }

  void _goToVideoCallScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VideoCallScreen(id, channelName)));
  }

  void _sendNotification(BuildContext context) {
    log("s");
    BlocProvider.of<NotificationCubit>(context)
        .createNotifications(id, 1, channelName);
  }
}
