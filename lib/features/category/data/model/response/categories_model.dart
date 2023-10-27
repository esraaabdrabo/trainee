
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/categories_entity.dart';
import 'category_model.dart';

class CategoriesModel extends BaseModel<CategoriesEntity> {
  CategoriesModel({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<CategoryModel>? items;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        items: json["items"] == null
            ? null
            : List<CategoryModel>.from(
                json["items"].map((x) => CategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount == null ? null : totalCount,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };

  @override
  CategoriesEntity toEntity() {
    return CategoriesEntity(
      items: items?.map((e) => e.toEntity()).toList(),
      totalCount: this.totalCount,
    );
  }
}
