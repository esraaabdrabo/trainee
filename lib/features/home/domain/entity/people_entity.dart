
import '../../../../core/entities/base_entity.dart';

class PeopleDataEntity extends BaseEntity {
    PeopleDataEntity({
        required this.succeed,
        required this.message,
        required this.people,
    });

    final bool succeed;
    final String? message;
    final List<PersonEntity> people;

  @override
  List<Object?> get props => [this.succeed, this.message, this.people];
}

class PersonEntity extends BaseEntity {
    PersonEntity({
        required this.name,
        required this.age,
    });
  

    final String? name;
    final int? age;

  @override
  List<Object?> get props =>[this.name, this.age];
}
