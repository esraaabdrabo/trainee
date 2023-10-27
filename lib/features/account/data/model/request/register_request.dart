
import 'package:dio/dio.dart';

import '../../../../../core/params/base_params.dart';

class RegisterRequest extends BaseParams{
  RegisterRequest({
    this.name,
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
    name: json["name"] == null ? null : json["name"],
    emailAddress: json["emailAddress"] == null ? null : json["emailAddress"],
    password: json["password"] == null ? null : json["password"],
    countryCode: json["countryCode"] == null ? null : json["countryCode"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "emailAddress": emailAddress == null ? null : emailAddress,
    "password": password == null ? null : password,
    "countryCode": countryCode == null ? null : countryCode,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
  };
}
