
import '../../../../../core/params/base_params.dart';

class ChangePasswordRequest extends BaseParams {
  ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  factory ChangePasswordRequest.fromMap(Map<String, dynamic> json) =>
      ChangePasswordRequest(
        currentPassword:
            json["currentPassword"] == null ? null : json["currentPassword"],
        newPassword: json["newPassword"] == null ? null : json["newPassword"],
      );

  Map<String, dynamic> toMap() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      };
}
