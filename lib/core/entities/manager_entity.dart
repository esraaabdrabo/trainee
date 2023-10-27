
import 'base_entity.dart';

class ManagerEntity extends BaseEntity {
  ManagerEntity({
    this.id,
    this.name,
    this.phoneNumber,
  });

  final int? id;
  final String? name;
  final String? phoneNumber;

  @override
  List<Object?> get props => [
        this.id,
        this.name,
        this.phoneNumber,
      ];
}
