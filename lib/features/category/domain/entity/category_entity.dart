
import '../../../../core/entities/base_entity.dart';

class CategoryEntity extends BaseEntity {
  CategoryEntity({
    this.imageUrl,
    this.iconUrl,
    this.types,
    this.isActive,
    this.arName,
    this.enName,
    this.name,
    this.id,
  });

  final String? imageUrl;
  final String? iconUrl;
  final int? types;
  final bool? isActive;
  final String? arName;
  final String? enName;
  final String? name;
  final int? id;

  @override
  List<Object?> get props => [
        this.imageUrl,
        this.iconUrl,
        this.types,
        this.isActive,
        this.arName,
        this.enName,
        this.name,
        this.id
      ];
}
