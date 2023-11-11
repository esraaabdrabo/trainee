import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/notifications/notification_service.dart';

void showNotification(
    bool hasActions, RemoteMessage event, String payload) async {
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    "com.yacotch.partner",
    "yacotch",
    styleInformation: BigTextStyleInformation(''),
    
    channelDescription: "notificationBase",
    enableVibration: true,
    playSound: true,
    icon: '@mipmap/ic_launcher',
    importance: Importance.high,
    priority: Priority.high,
    audioAttributesUsage: AudioAttributesUsage.alarm,
    
    actions: hasActions ? _buildAgoraActions : [],
  );
  notificationDetails(bool hasActions) => NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
  print(payload);
  String title =
      hasActions ? _getTrainerName(payload) : "${event.notification!.title}";
  String body =
      hasActions ? await _getMsg(payload) : "${event.notification!.body}";

  await flutterLocalNotificationsPlugin.show(
    200,
    title,
    body,
    notificationDetails(hasActions),
    payload: payload,
  );
}

Future<String> _getMsg(String payload) async {
  return await LanguageHelper.isArCached()
      ? payload
          .split(',')
          .firstWhere((element) => element.contains('ArMessage'))
          .replaceAll("ArMessage:", "")
      : payload
          .split(',')
          .firstWhere((element) => element.contains('EnMessage'))
          .replaceAll("EnMessage:", "");
}

String _getTrainerName(String payload) {
  return payload
      .split(',')
      .firstWhere((element) => element.contains('UserName'))
      .replaceAll("UserName:", "");
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
