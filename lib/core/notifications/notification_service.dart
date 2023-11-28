import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:upgrade_traine_project/core/notifications/calls/show.dart";
import "package:upgrade_traine_project/core/notifications/init_local_notification.dart";
import "package:upgrade_traine_project/core/notifications/onmessage_listener.dart";
import "package:upgrade_traine_project/core/notifications/permissions.dart";
import "package:flutter_callkit_incoming/flutter_callkit_incoming.dart";

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void setupNotifications() {
  initLocalNotification();
  requestPermissions();
  FirebaseMessaging.onMessage
      .listen((RemoteMessage event) async => handleOnMessageListener(event));
  FirebaseMessaging.onMessageOpenedApp
      .listen((RemoteMessage event) async => handleOnMessageListener(event));
}

@pragma("vm:entry-point")
Future<void> handleBackGround(message) async {
  handleOnMessageListener(message);
  FlutterCallkitIncoming.onEvent
      .listen((event) async => await handleCallKitResponseForBackground(event));
}
