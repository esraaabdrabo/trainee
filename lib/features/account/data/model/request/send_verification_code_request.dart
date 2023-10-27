
import '../../../../../core/params/base_params.dart';

class SendVerificationCodeRequest extends BaseParams {
  SendVerificationCodeRequest({
    this.phoneNumber,
    this.userType,
  });

  final String? phoneNumber;
  final int? userType;

  factory SendVerificationCodeRequest.fromMap(Map<String, dynamic> json) =>
      SendVerificationCodeRequest(
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        userType: json["userType"] == null ? null : json["userType"],
      );

  Map<String, dynamic> toMap() => {
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "userType": userType == null ? null : userType,
      };
}
