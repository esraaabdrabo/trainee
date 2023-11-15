import "package:firebase_messaging/firebase_messaging.dart";
import 'package:flutter/material.dart';
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:upgrade_traine_project/core/notifications/background_handler.dart";
import "package:upgrade_traine_project/core/notifications/init_local_notification.dart";
import "package:upgrade_traine_project/core/notifications/onmessage_listener.dart";
import "package:upgrade_traine_project/core/notifications/permissions.dart";


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void setupNotifications() {
  initLocalNotification();
  requestPermissions();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.onMessage
      .listen((RemoteMessage event) async => handleOnMessageListener(event));

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
    // handleNotificationsTap(event);
  });
}