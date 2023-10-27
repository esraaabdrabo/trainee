
import '../../../../core/entities/base_entity.dart';
import 'category_entity.dart';

class CategoriesEntity extends BaseEntity {
  CategoriesEntity({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<CategoryEntity>? items;

  @override
  List<Object?> get props => [this.totalCount, this.items];
}
