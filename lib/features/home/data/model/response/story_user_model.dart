import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/story_user_entity.dart';

class StoryUserModel extends BaseModel<StoryUserEntity> {
  StoryUserModel({
    this.value,
    this.text,
  });

  final int? value;
  final String? text;

  factory StoryUserModel.fromJson(Map<String, dynamic> json) => StoryUserModel(
        value: json["value"] == null ? null : json["value"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "text": text == null ? null : text,
      };

  @override
  StoryUserEntity toEntity() {
    return StoryUserEntity(text: this.text, value: this.value);
  }
}
