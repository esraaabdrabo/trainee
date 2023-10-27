
import '../entities/opening_day_entity.dart';
import 'base_model.dart';

class OpeningDayModel extends BaseModel<OpeningDayEntity> {
  OpeningDayModel({
    this.day,
    this.from,
    this.to,
  });

  final int? day;
  final DateTime? from;
  final DateTime? to;

  factory OpeningDayModel.fromJson(Map<String, dynamic> json) =>
      OpeningDayModel(
        day: json["day"] == null ? null : json["day"],
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "from": from == null ? null : from!.toIso8601String(),
        "to": to == null ? null : to!.toIso8601String(),
      };

  @override
  OpeningDayEntity toEntity() {
    return OpeningDayEntity(day: this.day, from: this.from, to: this.to);
  }
}
