
import '../../../../core/entities/base_entity.dart';

class StoryUserEntity extends BaseEntity {
  StoryUserEntity({
    this.value,
    this.text,
  });

  final int? value;
  final String? text;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
