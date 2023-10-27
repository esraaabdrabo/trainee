
import 'base_entity.dart';

class OpeningDayEntity extends BaseEntity {
  OpeningDayEntity({
    this.day,
    this.from,
    this.to,
  });

  final int? day;
  final DateTime? from;
  final DateTime? to;

  @override
  List<Object?> get props => [this.day, this.from, this.to];
}
