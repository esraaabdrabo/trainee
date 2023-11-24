import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:upgrade_traine_project/core/notifications/calls/call_kit_param.dart';
import 'package:upgrade_traine_project/core/notifications/calls/navigator.dart';
import 'package:upgrade_traine_project/core/notifications/calls/payload_extractor.dart';
import 'package:upgrade_traine_project/features/notification/data/repositories/notification_repo.dart';

void showCallNotification(String payload) {
  if (_isCancelNotification(payload)) {
    _endCall(payload);
  } else {
    FlutterCallkitIncoming.showCallkitIncoming(callKitParams(
        senderId: "${PayLoadDataExtractor.getSenderId(payload)}",
        name: PayLoadDataExtractor.getTrainerName(payload),
        type: PayLoadDataExtractor.getMsgType(payload)));
    FlutterCallkitIncoming.onEvent.listen((event) async {
      if (_isCancel(event!)) {
        _sendCancelNotification(payload);
      } else if (_isCallBack(event)) {
        _callBack(payload);
      } else if (_isAccept(event)) {
        await _handleAccept(payload);
      }
    });
  }
}

void _endCall(String payload) {
  FlutterCallkitIncoming.endCall(
      "${PayLoadDataExtractor.getSenderId(payload)}");
}

bool _isCancelNotification(String payload) =>
    PayLoadDataExtractor.getMsgType(payload) == -1;
bool _isCancel(CallEvent event) => event.event == Event.ACTION_CALL_DECLINE;

bool _isCallBack(CallEvent event) => event.event == Event.ACTION_CALL_CALLBACK;

bool _isAccept(CallEvent event) => event.event == Event.ACTION_CALL_ACCEPT;

Future<void> _handleAccept(String payload) async {
  if (_isVideo(payload)) {
    await CallsNavigator.goToVideoCallScreen(payload);
  } else {
    await CallsNavigator.goToVoiceCallScreen(payload);
  }
}

bool _isVideo(String payload) => PayLoadDataExtractor.getMsgType(payload) == 1;

void _callBack(String payload) async {
  await NotificationRepo().createNotification(
      PayLoadDataExtractor.getSenderId(payload),
      PayLoadDataExtractor.getMsgType(payload),
      PayLoadDataExtractor.getChannelName(payload));
  _isVideo(payload)
      ? await CallsNavigator.goToVideoCallScreen(payload)
      : await CallsNavigator.goToVoiceCallScreen(payload);
}

void _sendCancelNotification(String payload) =>
    NotificationRepo().createNotification(
        PayLoadDataExtractor.getSenderId(payload), -1, "cancel_call");
