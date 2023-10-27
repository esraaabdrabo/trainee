import 'package:upgrade_traine_project/features/home/data/model/response/story_model.dart';

import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/stories_entity.dart';

class StoriesModel extends BaseModel<StoriesEntity> {
  StoriesModel({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<StoryModel>? items;

  factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        items: json["items"] == null
            ? null
            : List<StoryModel>.from(
                json["items"].map((x) => StoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount == null ? null : totalCount,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };

  @override
  StoriesEntity toEntity() {
    return StoriesEntity(
      totalCount: this.totalCount,
      items: this.items?.map((e) => e.toEntity()).toList(),
    );
  }
}
