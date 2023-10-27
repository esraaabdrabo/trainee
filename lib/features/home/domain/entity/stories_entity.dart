
import 'package:upgrade_traine_project/features/home/domain/entity/story_entity.dart';

import '../../../../core/entities/base_entity.dart';

class StoriesEntity extends BaseEntity {
  StoriesEntity({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<StoryEntity>? items;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
