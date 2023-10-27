
import '../../../../core/entities/base_entity.dart';

class StoryImageEntity extends BaseEntity {
  StoryImageEntity({
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

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
