import 'package:upgrade_traine_project/core/localization/language_helper.dart';

abstract class PayLoadDataExtractor {
  static String getChannelName(String? payload) => payload!
      .split(',')
      .firstWhere((element) => element.contains('HiddenData'))
      .replaceAll("{HiddenData:", '')
      .trim();
  static Map<String, Object> getChannelNameAndId(String? payload) => {
        "id": getTrainerId(payload),
        "channel_name": getChannelName(payload),
        "remote_name": getTrainerName(payload!)
      };

  static int getTrainerId(String? payload) {
    return int.parse(payload!
        .split(',')
        .firstWhere((element) => element.contains('SenderId'))
        .replaceAll("SenderId:", '')
        .trim());
  }

  static int getMsgType(String payload) {
    return int.parse(payload
        .split(',')
        .firstWhere((element) => element.contains('MsgType'))
        .replaceAll("MsgType:", ""));
  }

  static String getTrainerName(String payload) {
    return payload
        .split(',')
        .firstWhere((element) => element.contains('UserName'))
        .replaceAll("UserName:", "");
  }

  static Future<String> getMsg(String payload) async {
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
}
