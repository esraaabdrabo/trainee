import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';

CallKitParams _callKitParams({required String name, required int type}) =>
    CallKitParams(
      id: "1",
      nameCaller: '$name is calling you.',
      appName: 'Callkit',
      avatar: 'https://i.pravatar.cc/100',
      handle:
          'It\'s a ${type == 2 ? "voice" : "video"} call for now. Pick up when you\'re ready!',
      type: 0,
      textAccept: 'Accept',
      textDecline: 'Decline',
      textMissedCall: "missedddd callll",
      duration: 10000,
      extra: <String, dynamic>{'userId': '1a2b3c4d'},
      headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      android: const AndroidParams(
        isCustomNotification: true,
        isShowLogo: true,
        isShowMissedCallNotification: true,
        isShowCallback: true,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#0955fa',
        backgroundUrl: 'https://i.pravatar.cc/500',
        actionColor: '#4CAF50',
        incomingCallNotificationChannelName: "Incoming Call",
        missedCallNotificationChannelName: "Missed Call",
      ),
      ios: IOSParams(
        iconName: 'CallKitLogo',
        handleType: 'generic',
        supportsVideo: true,
        maximumCallGroups: 2,
        maximumCallsPerCallGroup: 1,
        audioSessionMode: 'default',
        audioSessionActive: true,
        audioSessionPreferredSampleRate: 44100.0,
        audioSessionPreferredIOBufferDuration: 0.005,
        supportsDTMF: true,
        supportsHolding: true,
        supportsGrouping: false,
        supportsUngrouping: false,
        ringtonePath: 'system_ringtone_default',
      ),
    );

void showNotification(
    bool hasActions, RemoteMessage event, String payload) async {
  if (hasActions) {
    //agora call (voice - video)
    FlutterCallkitIncoming.showCallkitIncoming(_callKitParams(
        name: _getTrainerName(payload), type: _getMsgType(payload)));
    FlutterCallkitIncoming.onEvent.listen((event) {
      if (event!.event == Event.ACTION_CALL_DECLINE) {
        print("cancel");
      } else if (event.event == Event.ACTION_CALL_CALLBACK) {
        print("call back");
      } else if (event.event == Event.ACTION_CALL_ACCEPT) {
        print('accept');
      }
    });
  }
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
  String title =
      hasActions ? _getTrainerName(payload) : "${event.notification!.title}";
  String body =
      hasActions ? await _getMsg(payload) : "${event.notification!.body}";

//  await flutterLocalNotificationsPlugin.show(
//    200,
//    title,
//    body,
//    notificationDetails(hasActions),
//    payload: payload,
//  );
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

int _getMsgType(String payload) {
  return int.parse(payload
      .split(',')
      .firstWhere((element) => element.contains('MsgType'))
      .replaceAll("MsgType:", ""));
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
