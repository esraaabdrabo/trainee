
import 'package:upgrade_traine_project/features/profile/domain/entity/trainer_entity.dart';
import 'package:upgrade_traine_project/features/shop/domain/entity/shop_entity.dart';

import '../../../../core/entities/base_entity.dart';

class TrainersEntity extends BaseEntity {
  TrainersEntity({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<TrainerEntity>? items;

  @override
  List<Object?> get props => [];
}
