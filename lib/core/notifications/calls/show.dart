import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:upgrade_traine_project/core/notifications/calls/call_kit_param.dart';
import 'package:upgrade_traine_project/core/notifications/calls/navigator.dart';
import 'package:upgrade_traine_project/core/notifications/calls/payload_extractor.dart';

void showCallNotification(String payload) {
  FlutterCallkitIncoming.showCallkitIncoming(callKitParams(
      name: PayLoadDataExtractor.getTrainerName(payload),
      type: PayLoadDataExtractor.getMsgType(payload)));
  FlutterCallkitIncoming.onEvent.listen((event) async {
    if (event!.event == Event.ACTION_CALL_DECLINE) {
      print("cancel");
    } else if (event.event == Event.ACTION_CALL_CALLBACK) {
      print("call back");
    } else if (event.event == Event.ACTION_CALL_ACCEPT) {
      if (PayLoadDataExtractor.getMsgType(payload) == 1) {
        await CallsNavigator.goToVideoCallScreen(payload);
      } else {
        await CallsNavigator.goToVoiceCallScreen(payload);
      }
    }
  });
}
