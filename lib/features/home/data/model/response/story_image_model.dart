import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/story_image_entity.dart';

class StoryImageModel extends BaseModel<StoryImageEntity> {
  StoryImageModel({
    this.isVideo,
    this.fileUrl,
    this.order,
    this.storyId,
    this.id,
  });

  final bool? isVideo;
  final String? fileUrl;
  final int? order;
  final int? storyId;
  final int? id;

  factory StoryImageModel.fromJson(Map<String, dynamic> json) =>
      StoryImageModel(
        isVideo: json["isVideo"] == null ? null : json["isVideo"],
        fileUrl: json["fileUrl"] == null ? null : json["fileUrl"],
        order: json["order"] == null ? null : json["order"],
        storyId: json["storyId"] == null ? null : json["storyId"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "isVideo": isVideo == null ? null : isVideo,
        "fileUrl": fileUrl == null ? null : fileUrl,
        "order": order == null ? null : order,
        "storyId": storyId == null ? null : storyId,
        "id": id == null ? null : id,
      };

  @override
  StoryImageEntity toEntity() {
    return StoryImageEntity(
      id: this.id,
      fileUrl: this.fileUrl,
      isVideo: this.isVideo,
      order: this.order,
      storyId: this.storyId,
    );
  }
}
