import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:upgrade_traine_project/core/notifications/calls/payload_extractor.dart';
import 'package:upgrade_traine_project/core/notifications/calls/show.dart';
import 'package:upgrade_traine_project/core/notifications/notification_service.dart';

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
      AndroidNotificationDetails(
    "com.yacotch.partner",
    "yacotch",
    styleInformation: const BigTextStyleInformation(''),
    channelDescription: "notificationBase",
    enableVibration: true,
    playSound: true,
    icon: '@mipmap/ic_launcher',
    importance: Importance.high,
    priority: Priority.high,
    // audioAttributesUsage: AudioAttributesUsage.,
    sound: const RawResourceAndroidNotificationSound("call_ring"),
    actions: hasActions ? _buildAgoraActions : [],
  );
  notificationDetails(bool hasActions) => NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
  print(payload);
  String title = hasActions
      ? PayLoadDataExtractor.getTrainerName(payload)
      : "${event.notification!.title}";
  String body = hasActions
      ? await PayLoadDataExtractor.getMsg(payload)
      : "${event.notification!.body}";

  await flutterLocalNotificationsPlugin.show(
    200,
    title,
    body,
    notificationDetails(hasActions),
    payload: payload,
  );
}

List<AndroidNotificationAction> get _buildAgoraActions {
  return <AndroidNotificationAction>[
    const AndroidNotificationAction(
        //   icon: ByteArrayAndroidBitmap((await iconToBytes(Icons.done, 25))),
        'true',
        showsUserInterface: true,
        inputs: [
          AndroidNotificationActionInput(choices: ["Accept", "Cancel"])
        ],
        ''),
  ];
}
