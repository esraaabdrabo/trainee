import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/net/api_url.dart';
import '../models/notification_model.dart';

class NotificationRepo {
  Future<Either<String, List<NotificationModel>>> getNotifications() async {
    final response = await DioHelper.get(
      APIUrls.API_GET_NOTIFICATIONS,
    );
    print(response.data);
    try {
      if (response.data['success'] == true) {
        List<NotificationModel> notifications = [];
        for (int i = 0; i < response.data['result']["items"].length; i++) {
          notifications.add(
              NotificationModel.fromJson(response.data['result']["items"][i]));
        }
        return Right(notifications);
      } else {
        return Left(response.data['error']['message']);
      }
    } catch (e) {
      print(e);
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> createNotification(
    int userId,
    int messageType,
  ) async {
    final response = await DioHelper.post(APIUrls.API_CREATE_NOTIFICATIONS,
        formData: {
          "userId": userId,
          "NotificationType": 1,
          "msgType": messageType
        });
    log(response.data.toString());
    print("after request");
    try {
      if (response.data['success'] == true) {
        print(response.data);
        log("succ");
        return const Right(true);
      } else {
        print(response.data);
        log("//////////////////////////////////////////////////////////////////");

        return Left(response.data['error']['message']);
      }
    } catch (e) {
      log("catch");
      print(e);
      print(
          "//////////////////////////////////////////////////////////////////");
      return Left(e.toString());
    }
  }
}
