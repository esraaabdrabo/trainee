import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/video_call_screen.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/voice_call_screen.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/provider/coach_profile_screen_notifier.dart';
import 'package:upgrade_traine_project/features/notification/presentation/controller/notification_cubit.dart';
import 'package:upgrade_traine_project/features/profile/presentation/state_m/cubit/profile_cubit.dart';

abstract class CoachProfileFunction {
  static String getChannelName(
          BuildContext context, CoachProfileScreenNotifier sn) =>
      "${BlocProvider.of<ProfileCubit>(context).profileModel?.result?.id!}${sn.coachEntity.id}";

  static int? getMyId(BuildContext context) {
    return BlocProvider.of<ProfileCubit>(context).profileModel!.result!.id;
  }

  static void goToVideoCallScreen(
      BuildContext context, CoachProfileScreenNotifier sn) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VideoCallScreen(
              sn.coachEntity.id!,
              getChannelName(context, sn),
              remoteName: sn.coachEntity.name!,
            )));
    BlocProvider.of<NotificationCubit>(context).createNotifications(
        sn.coachEntity.id!, 1, getChannelName(context, sn));
  }

  static void goToVoiceCallScreen(
      BuildContext context, CoachProfileScreenNotifier sn) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VoiceCallScreen(
              sn.coachEntity.id!,
              getChannelName(context,sn),
              remoteName: sn.coachEntity.name!,
            )));
    BlocProvider.of<NotificationCubit>(context).createNotifications(
        sn.coachEntity.id!, 2, getChannelName(context, sn));
  }
}
