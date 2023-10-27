
import '../entities/error_entity.dart';
import 'base_model.dart';

class ErrorModel extends BaseModel<ErrorEntity> {
  ErrorModel({
    this.code,
    this.message,
    this.details,
    this.validationErrors,
  });

  final int? code;
  final String? message;
  final String? details;
  final dynamic validationErrors;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
        details: json["details"] == null ? null : json["details"],
        validationErrors: json["validationErrors"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
        "details": details == null ? null : details,
        "validationErrors": validationErrors,
      };

  @override
  ErrorEntity toEntity() {
    return ErrorEntity(
      code: this.code,
      details: this.details,
      message: this.message,
      validationErrors: this.validationErrors,
    );
  }
}
