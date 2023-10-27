
import '../../../../../core/entities/specialization_entity.dart';
import '../../../../../core/models/base_model.dart';

class SpecializationModel extends BaseModel<SpecializationEntity> {
  SpecializationModel({
    this.value,
    this.text,
  });

  final int? value;
  final String? text;

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      SpecializationModel(
        value: json["value"] == null ? null : json["value"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "text": text == null ? null : text,
      };

  @override
  SpecializationEntity toEntity() {
    return SpecializationEntity(
      text: this.text,
      value: this.value,
    );
  }
}
