
import '../entities/manager_entity.dart';
import 'base_model.dart';

class ManagerModel extends BaseModel<ManagerEntity> {
  ManagerModel({
    this.id,
    this.name,
    this.phoneNumber,
  });

  final int? id;
  final String? name;
  final String? phoneNumber;

  factory ManagerModel.fromJson(Map<String, dynamic> json) => ManagerModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
      };

  @override
  ManagerEntity toEntity() {
    return ManagerEntity(
        name: this.name, id: this.id, phoneNumber: this.phoneNumber);
  }
}
