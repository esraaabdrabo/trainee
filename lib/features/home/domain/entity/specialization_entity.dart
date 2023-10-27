

import 'package:upgrade_traine_project/core/entities/base_entity.dart';

class SpecializationEntity extends BaseEntity {
  SpecializationEntity({
    this.value,
    this.text,
  });

  final int? value;
  final String? text;

  @override
  List<Object?> get props => [this.value, this.text];
}
