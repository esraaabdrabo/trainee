
import '../../../../core/entities/base_entity.dart';
import 'coach_entity.dart';

class CoachesEntity extends BaseEntity {
  CoachesEntity({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<CoachEntity>? items;

  @override
  List<Object?> get props => [
        this.totalCount,
        this.items,
      ];
}
