
import '../../../../core/entities/base_entity.dart';
import '../../../../core/entities/specialization_entity.dart';

class SpecializationsEntity extends BaseEntity {
  SpecializationsEntity({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<SpecializationEntity>? items;

  @override
  List<Object?> get props => [
        this.totalCount,
        this.items,
      ];
}

