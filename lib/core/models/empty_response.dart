import '../../core/entities/base_entity.dart';
import 'base_model.dart';

class EmptyResponse extends BaseModel {
  final bool succeed;
  final String message;

  EmptyResponse({
    required this.succeed,
    required this.message,
  });

  factory EmptyResponse.fromMap(Map<String, dynamic> json) => EmptyResponse(
        succeed: json["succeed"] ?? false,
        message: json["message"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "succeed": succeed,
        "message": message,
      };

  @override
  BaseEntity toEntity() {
    throw UnimplementedError();
  }
}
