import 'package:dio/dio.dart';

import '../../../../../core/params/base_params.dart';

class LoginRequest extends BaseParams {
  LoginRequest(
      {this.userNameOrEmailAddress,
      this.password,
      this.rememberClient,
      CancelToken? cancelToken})
      : super(cancelToken: cancelToken);

  final String? userNameOrEmailAddress;
  final String? password;
  final bool? rememberClient;

  factory LoginRequest.fromMap(Map<String, dynamic> json) => LoginRequest(
        userNameOrEmailAddress: json["userNameOrEmailAddress"] == null
            ? null
            : json["userNameOrEmailAddress"],
        password: json["password"] == null ? null : json["password"],
        rememberClient:
            json["rememberClient"] == null ? null : json["rememberClient"],
      );

  Map<String, dynamic> toMap() => {
        "userNameOrEmailAddress":
            userNameOrEmailAddress == null ? null : userNameOrEmailAddress,
        "password": password == null ? null : password,
        "rememberClient": rememberClient == null ? null : rememberClient,
      };
}
