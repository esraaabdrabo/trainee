import 'package:flutter_callkit_incoming/entities/entities.dart';

CallKitParams callKitParams(
        {required String senderId, required String name, required int type}) =>
    CallKitParams(
      id: senderId,
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
