
import 'package:upgrade_traine_project/features/home/domain/entity/story_image_entity.dart';
import 'package:upgrade_traine_project/features/home/domain/entity/story_user_entity.dart';

import '../../../../core/entities/base_entity.dart';

class StoryEntity extends BaseEntity {
  StoryEntity(
      {this.description,
      this.creationTime,
      this.userId,
      this.user,
      this.storyImages,
      this.id,
      this.isShared});

  final String? description;
  final DateTime? creationTime;
  final int? userId;
  final StoryUserEntity? user;
  final List<StoryImageEntity>? storyImages;
  final int? id;
  final bool? isShared;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
