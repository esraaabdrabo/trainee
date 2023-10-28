import 'package:dio/dio.dart';

import '../../../../../core/params/base_params.dart';

class RegisterRequest extends BaseParams {
  RegisterRequest(
      {this.name,
      this.emailAddress,
      this.password,
      this.countryCode,
      this.phoneNumber,
      CancelToken? cancelToken})
      : super(cancelToken: cancelToken);

  final String? name;
  final String? emailAddress;
  final String? password;
  final String? countryCode;
  final String? phoneNumber;

  factory RegisterRequest.fromMap(Map<String, dynamic> json) => RegisterRequest(
        name: json["name"],
        emailAddress: json["emailAddress"],
        password: json["password"],
        countryCode: json["countryCode"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "emailAddress": emailAddress,
        "password": password,
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
      };
}
