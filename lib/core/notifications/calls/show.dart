import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrade_traine_project/core/datasources/shared_preference.dart';
import 'package:upgrade_traine_project/core/notifications/calls/call_kit_param.dart';
import 'package:upgrade_traine_project/core/notifications/calls/navigator.dart';
import 'package:upgrade_traine_project/core/notifications/calls/payload_extractor.dart';
import 'package:upgrade_traine_project/core/ui/error_ui/toast.dart';
import 'package:upgrade_traine_project/di/service_locator.dart';
import 'package:upgrade_traine_project/features/notification/data/repositories/notification_repo.dart';

void showCallNotification(String payload) {
  if (_isCancelNotification(payload)) {
    _endCall(payload);
  } else {
    FlutterCallkitIncoming.showCallkitIncoming(_getParam(payload));
  }
}

void handleCallKitResponse(CallEvent? event) async {
  String payload = event!.body['extra']['payload'];

  if (_isCancel(event)) {
    _sendCancelNotification(payload);
  } else if (_isCallBack(event)) {
    _callBack(payload);
  } else if (_isAccept(event)) {
    await _handleAccept(payload);
  }
}

//in background we can not navigate to the video/voice screen because we do not have context
//so we will cache a key that indicates which event happened
//we the app is opened we will check for this key and perform specific action according to it
Future<void> handleCallKitResponseForBackground(CallEvent? event) async {
  String payload = event!.body['extra']['payload'];

  if (_isCancel(event)) {
    //notify the user that i cant respond to his call for now
    _sendCancelNotification(payload);
  } else if (_isCallBack(event)) {
    //send call notification and navigate to the screen
    await _sendCallBackNotification(payload);
    await cacheScreenName(payload);
    await cachePayload(payload);
  } else if (_isAccept(event)) {
    // navigate to the voice/video screen
    await cacheScreenName(payload);
    await cachePayload(payload);
  }
}

Future<void> cacheScreenName(String payload) async {
  final pref = await SpUtil.getInstance();
  await pref.putString("navigate_to", _isVideo(payload) ? "video" : "voice");
}

Future<void> cachePayload(String payload) async {
  final pref = await SpUtil.getInstance();
  await pref.putString("payload", payload);
}

CallKitParams _getParam(String payload) => callKitParams(payload);

void _endCall(String payload) {
  FlutterCallkitIncoming.endCall(
      "${PayLoadDataExtractor.getSenderId(payload)}");
}

bool _isCancelNotification(String payload) =>
    PayLoadDataExtractor.getMsgType(payload) == -1;
//know the event type to perform the action
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
  await _sendCallBackNotification(payload);
  _isVideo(payload)
      ? await CallsNavigator.goToVideoCallScreen(payload)
      : await CallsNavigator.goToVoiceCallScreen(payload);
}

Future<void> _sendCallBackNotification(String payload) async {
  await NotificationRepo().createNotification(
      PayLoadDataExtractor.getSenderId(payload),
      PayLoadDataExtractor.getMsgType(payload),
      PayLoadDataExtractor.getChannelName(payload));
}

void _sendCancelNotification(String payload) =>
    NotificationRepo().createNotification(
        PayLoadDataExtractor.getSenderId(payload), -1, "cancel_call");
