
import '../../../../core/entities/base_entity.dart';

class CommentsEntity extends BaseEntity {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  CommentsEntity({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  @override
  List<Object?> get props => [
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  ];
}
