

import '../../../../../core/params/base_params.dart';

class VerifyAccountRequest extends BaseParams{
  VerifyAccountRequest({
    this.usernameOrEmailOrPhone,
    this.code,
  });

  final String? usernameOrEmailOrPhone;
  final String? code;

  factory VerifyAccountRequest.fromMap(Map<String, dynamic> json) => VerifyAccountRequest(
    usernameOrEmailOrPhone: json["usernameOrEmailOrPhone"] == null ? null : json["usernameOrEmailOrPhone"],
    code: json["code"] == null ? null : json["code"],
  );

  Map<String, dynamic> toMap() => {
    "usernameOrEmailOrPhone": usernameOrEmailOrPhone == null ? null : usernameOrEmailOrPhone,
    "code": code == null ? null : code,
  };
}
