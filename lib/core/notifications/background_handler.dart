import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/notifications/notification_service.dart';
import 'package:upgrade_traine_project/features/notification/presentation/view/notification_screen.dart';
import 'package:upgrade_traine_project/main.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  Navigator.of(navigatorKey.currentState!.context).push(
    MaterialPageRoute(builder: (context) => const NotificationScreen()),
  );
  // if (int.parse(message.data["type"]) == -1) {
  //   navigatorKey.currentState!.context.read<AuthCubit>().onUpdateAuth(false);
  //   navigatorKey.currentState!.context.read<UserCubit>().onUpdateUserData(UserModel());
  //   Utils.clearSavedData();
  //   GlobalState.instance.set("token", "");
  //   navigatorKey.currentState!.pushNamed(Routes.loginRoute);
  // }else if (int.parse(message.data["type"]) == 10){
  //   UserModel user = navigatorKey.currentState!.context.read<UserCubit>().state.model;
  //   user.isApproved = true;
  //   navigatorKey.currentState!.context.read<UserCubit>().onUpdateUserData(user);
  // }
  await Firebase.initializeApp();
}
