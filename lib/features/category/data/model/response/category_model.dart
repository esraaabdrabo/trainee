
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/category_entity.dart';

class CategoryModel extends BaseModel<CategoryEntity> {
  CategoryModel({
    this.imageUrl,
    this.iconUrl,
    this.types,
    this.isActive,
    this.arName,
    this.enName,
    this.name,
    this.id,
  });

  final String? imageUrl;
  final String? iconUrl;
  final int? types;
  final bool? isActive;
  final String? arName;
  final String? enName;
  final String? name;
  final int? id;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        iconUrl: json["iconUrl"] == null ? null : json["iconUrl"],
        types: json["type"] == null ? null : json["type"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        arName: json["arName"] == null ? null : json["arName"],
        enName: json["enName"] == null ? null : json["enName"],
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl == null ? null : imageUrl,
        "iconUrl": iconUrl == null ? null : iconUrl,
        "types": types == null ? null : types,
        "isActive": isActive == null ? null : isActive,
        "arName": arName == null ? null : arName,
        "enName": enName == null ? null : enName,
        "name": name == null ? null : name,
        "id": id == null ? null : id,
      };

  @override
  CategoryEntity toEntity() {
    return CategoryEntity(
        types: this.types,
        name: this.name,
        arName: this.arName,
        enName: this.enName,
        iconUrl: this.iconUrl,
        id: this.id,
        imageUrl: this.imageUrl,
        isActive: this.isActive);
  }
}
