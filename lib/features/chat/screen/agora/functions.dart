import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrade_traine_project/core/dioHelper/dio_helper.dart';
import 'package:upgrade_traine_project/core/notifications/calls/navigator.dart';

abstract class AgoraFunctions {
  static bool isInitLoading(AsyncSnapshot<void> snapShot) =>
      snapShot.connectionState == ConnectionState.waiting;

  static Future<String> getToken(String channelName) async {
    var url =
        "https://api.yacotch.com/api/services/app/Agora/GetToken?Channel=$channelName";
    return (await DioHelper.get(url)
        .then((value) => value.data['result']['token']));
  }

  static Future<String> getRtmToken(String channelName) async {
    var url =
        "https://api.yacotch.com/api/services/app/Agora/GetToken?Channel=$channelName";
    return (await DioHelper.get(url)
        .then((value) => value.data['result']['token']));
  }

  static bool isLocalDisabledVideo(AgoraClient client) =>
      client.sessionController.value.isLocalVideoDisabled;

  static bool isLocalMuteVoice(AgoraClient client) =>
      client.sessionController.value.isLocalUserMuted;

  /// from shared pref get the cached screen name (voice-video-null)
  static Future<String?> getAgoraScreen() async {
    final pref = await SharedPreferences.getInstance();
    await pref.reload();
    return (pref).getString("navigate_to");
  }

  ///if we found a screen name then we will need the payload to navigate
  static Future<String?> getAgoraPayload() async {
    final pref = await SharedPreferences.getInstance();
    await pref.reload();
    return pref.getString("payload");
  }

  ///do we have cached agora screen name ? (voice-video)
  static bool isAppOpenedForAgora(String? screenName) => screenName != null;

  ///check if the app is coming from background to make voice-video call
  ///or the user just open the app as normal
  static Future<void> handleNavigatingToAgora() async {
    final pref = await SharedPreferences.getInstance();

    String? agoraScreen = await getAgoraScreen();
    String? payload = await getAgoraPayload();

    if (isAppOpenedForAgora(agoraScreen)) {
      //clear the key we will not need it any more
      pref
        ..remove("navigate_to")
        ..remove("payload");
      agoraScreen == "video"
          ? CallsNavigator.goToVideoCallScreen(payload)
          : CallsNavigator.goToVoiceCallScreen(payload);
    }
  }
}
