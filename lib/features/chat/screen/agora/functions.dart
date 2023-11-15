import 'package:upgrade_traine_project/core/dioHelper/dio_helper.dart';

abstract class AgoraFunctions {
  static Future<
      dynamic> getToken(String channelName) async => (await DioHelper.get(
          "https://api.yacotch.com/api/services/app/Agora/GetToken?Channel=$channelName")
      .then((value) => value.data['result']['token']));
}
