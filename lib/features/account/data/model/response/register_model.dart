
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/register_entity.dart';

class RegisterModel extends BaseModel<RegisterEntity> {
  RegisterModel({
    this.canLogin,
  });

  final bool? canLogin;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        canLogin: json["canLogin"] == null ? null : json["canLogin"],
      );

  Map<String, dynamic> toJson() => {
        "canLogin": canLogin == null ? null : canLogin,
      };

  @override
  RegisterEntity toEntity() {
    return RegisterEntity(
      canLogin: this.canLogin,
    );
  }
}
