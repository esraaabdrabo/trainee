import '../../../../core/entities/base_entity.dart';

class TrainerEntity extends BaseEntity {
  TrainerEntity(
      {
      this.name,
      this.imageUrl,

      this.id});

  final String? name;

  final String? imageUrl;

  final int? id;

  @override
  List<Object?> get props => [

        name,
        imageUrl,
            id
      ];
}
