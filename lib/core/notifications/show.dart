import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:upgrade_traine_project/core/notifications/calls/payload_extractor.dart';
import 'package:upgrade_traine_project/core/notifications/calls/show.dart';

void showNotification(
    bool hasActions, RemoteMessage event, String payload) async {
  if (hasActions) {
    //agora call (voice - video)
    showCallNotification(payload);
  } else {
    await _showNormalNotification(hasActions, payload, event);
  }
}

Future<void> _showNormalNotification(
    bool hasActions, String payload, RemoteMessage event) async {
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      const AndroidNotificationDetails(
    "com.yacotch.partner",
    "yacotch",
    styleInformation: BigTextStyleInformation(''),
    channelDescription: "notificationBase",
    enableVibration: true,
    playSound: true,
    icon: '@mipmap/ic_launcher',
    importance: Importance.high,
    priority: Priority.high,
  );
  notificationDetails(bool hasActions) => NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
  String title = "${event.notification!.title}";
  String body = "${event.notification!.body}";

  await FlutterLocalNotificationsPlugin().show(
    200,
    title,
    body,
    notificationDetails(hasActions),
    payload: payload,
  );
}
