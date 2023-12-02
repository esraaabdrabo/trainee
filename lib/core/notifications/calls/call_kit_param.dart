import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:upgrade_traine_project/core/notifications/calls/payload_extractor.dart';

CallKitParams callKitParams(String payload) => CallKitParams(
      id: "${PayLoadDataExtractor.getSenderId(payload)}",
      nameCaller:
          '${PayLoadDataExtractor.getTrainerName(payload)} is calling you.',
      appName: 'Callkit',
      avatar: _isVoice(payload)
          ? "https://www.kindpng.com/picc/m/403-4036753_voice-call-icon-formation4you-hd-png-download.png"
          : "https://assets.website-files.com/61120cb2509e011efcf0b1e4/6125f135480738fbcb0747b9_zoom-p-500.png",
      handle:
          'It\'s a ${_isVoice(payload) ? "voice" : "video"} call for now. Pick up when you\'re ready!',
      type: double.parse("${PayLoadDataExtractor.getMsgType(payload)}"),
      textAccept: 'Accept',
      textDecline: 'Decline',
      //ca: "mised call",
      duration: 10000,
      extra: <String, dynamic>{'payload': payload},
      headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      android: const AndroidParams(
        isCustomNotification: true,
        isShowLogo: true,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#0955fa',
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

bool _isVoice(String payload) => PayLoadDataExtractor.getMsgType(payload) == 2;
