import 'package:upgrade_traine_project/features/home/data/model/response/story_image_model.dart';
import 'package:upgrade_traine_project/features/home/data/model/response/story_user_model.dart';

import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/story_entity.dart';

class StoryModel extends BaseModel<StoryEntity> {
  StoryModel({
    this.description,
    this.creationTime,
    this.userId,
    this.user,
    this.storyImages,
    this.id,
  });

  final String? description;
  final DateTime? creationTime;
  final int? userId;
  final StoryUserModel? user;
  final List<StoryImageModel>? storyImages;
  final int? id;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        description: json["description"] == null ? null : json["description"],
        creationTime: json["creationTime"] == null
            ? null
            : DateTime.parse(json["creationTime"]),
        userId: json["userId"] == null ? null : json["userId"],
        user:
            json["user"] == null ? null : StoryUserModel.fromJson(json["user"]),
        storyImages: json["storyImages"] == null
            ? null
            : List<StoryImageModel>.from(
                json["storyImages"].map((x) => StoryImageModel.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "creationTime":
            creationTime == null ? null : creationTime!.toIso8601String(),
        "userId": userId == null ? null : userId,
        "user": user == null ? null : user!.toJson(),
        "storyImages": storyImages == null
            ? null
            : List<dynamic>.from(storyImages!.map((x) => x.toJson())),
        "id": id == null ? null : id,
      };

  @override
  StoryEntity toEntity() {
    return StoryEntity(
      description: this.description,
      id: this.id,
      creationTime: this.creationTime,
      user: this.user?.toEntity(),
      userId: this.userId,
      storyImages: this.storyImages?.map((e) => e.toEntity()).toList(),
    );
  }
}
