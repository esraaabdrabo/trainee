

import '../../../../../core/params/base_params.dart';

class ForgotPasswordRequest  extends BaseParams{
  ForgotPasswordRequest({
    this.usernameOrEmailOrPhone,
  });

  final String? usernameOrEmailOrPhone;

  factory ForgotPasswordRequest.fromMap(Map<String, dynamic> json) => ForgotPasswordRequest(
    usernameOrEmailOrPhone: json["usernameOrEmailOrPhone"] == null ? null : json["usernameOrEmailOrPhone"],
  );

  Map<String, dynamic> toMap() => {
    "usernameOrEmailOrPhone": usernameOrEmailOrPhone == null ? null : usernameOrEmailOrPhone,
  };
}
