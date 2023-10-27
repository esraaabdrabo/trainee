
import '../entities/city_entity.dart';
import 'base_model.dart';

class CityModel extends BaseModel<CityEntity> {
  CityModel({
    this.value,
    this.text,
  });

  final int? value;
  final String? text;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        value: json["value"] == null ? null : json["value"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "text": text == null ? null : text,
      };

  @override
  CityEntity toEntity() {
    return CityEntity(
      text: this.text,
      value: this.value,
    );
  }
}
