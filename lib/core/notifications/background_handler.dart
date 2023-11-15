import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/notifications/notification_service.dart';
import 'package:upgrade_traine_project/features/notification/presentation/view/notification_screen.dart';
import 'package:upgrade_traine_project/main.dart';

Future<void> backgroundHandler(RemoteMessage message) async {

 
  await Firebase.initializeApp();
}
