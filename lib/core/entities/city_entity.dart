
import 'base_entity.dart';

class CityEntity extends BaseEntity {
  CityEntity({
    this.value,
    this.text,
  });

  final int? value;
  final String? text;

  @override
  List<Object?> get props => [this.text, this.value];
}
