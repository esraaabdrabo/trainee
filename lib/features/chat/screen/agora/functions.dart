import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/dioHelper/dio_helper.dart';

abstract class AgoraFunctions {
  static bool isInitLoading(AsyncSnapshot<void> snapShot) =>
      snapShot.connectionState == ConnectionState.waiting;

  static Future<String> getToken(String channelName) async {
    var url =
        "https://api.yacotch.com/api/services/app/Agora/GetToken?Channel=$channelName";
    return (await DioHelper.get(url)
        .then((value) => value.data['result']['token']));
  }
}
