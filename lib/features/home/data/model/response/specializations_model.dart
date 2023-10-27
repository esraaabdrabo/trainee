import '../../../../../core/models/base_model.dart';
import '../../../../../core/models/specialization_model.dart';
import '../../../domain/entity/specializations_entity.dart';

class SpecializationsModel extends BaseModel<SpecializationsEntity> {
  SpecializationsModel({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<dynamic>? items;

  factory SpecializationsModel.fromJson(Map<String, dynamic> json) =>
      SpecializationsModel(
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        items: json["items"] == null
            ? null
            : List<SpecializationModel>.from(
                json["items"].map((x) => SpecializationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount == null ? null : totalCount,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };

  @override
  SpecializationsEntity toEntity() {
    return SpecializationsEntity(
      //items: this.items?.map((e) => e.toEntity()).toList(),
      items: [],
      totalCount: this.totalCount,
    );
  }
}
