
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/coaches_entity.dart';
import 'coach_model.dart';

class CoachesModel extends BaseModel<CoachesEntity> {
  CoachesModel({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<CoachModel>? items;

  factory CoachesModel.fromJson(Map<String, dynamic> json) => CoachesModel(
        totalCount: json["totalCount"],
        items: json["items"] == null
            ? null
            : List<CoachModel>.from(
                json["items"].map((x) => CoachModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };

  @override
  CoachesEntity toEntity() {
    return CoachesEntity(
      items: this.items?.map((e) => e.toEntity()).toList(),
    );
  }
}
