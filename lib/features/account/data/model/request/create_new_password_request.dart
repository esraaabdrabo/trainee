
import '../../../../../core/params/base_params.dart';

class CreateNewPasswordRequest extends BaseParams {
  CreateNewPasswordRequest({
    this.usernameOrEmailOrPhone,
    this.code,
    this.newPassword,
  });

  final String? usernameOrEmailOrPhone;
  final String? code;
  final String? newPassword;

  factory CreateNewPasswordRequest.fromMap(Map<String, dynamic> json) =>
      CreateNewPasswordRequest(
        usernameOrEmailOrPhone: json["usernameOrEmailOrPhone"] == null
            ? null
            : json["usernameOrEmailOrPhone"],
        code: json["code"] == null ? null : json["code"],
        newPassword: json["newPassword"] == null ? null : json["newPassword"],
      );

  Map<String, dynamic> toMap() => {
        "usernameOrEmailOrPhone":
            usernameOrEmailOrPhone == null ? null : usernameOrEmailOrPhone,
        "code": code == null ? null : code,
        "newPassword": newPassword == null ? null : newPassword,
      };
}
