import 'dart:convert';

import 'package:upgrade_traine_project/core/common/extensions/base_model_list_extension.dart';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/people_entity.dart';

class PeopleDataModel extends BaseModel<PeopleDataEntity> {
  PeopleDataModel({
    required this.succeed,
    required this.message,
    required this.people,
  });

  final bool succeed;
  final String? message;
  final List<PersonModel> people;

  factory PeopleDataModel.fromJson(String str) =>
      PeopleDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PeopleDataModel.fromMap(Map<String, dynamic> json) => PeopleDataModel(
        succeed: boolV(json["succeed"]),
        message: stringV(json["message"]),
        people: json["people"] == null
            ? []
            : List<PersonModel>.from(
                json["people"].map((x) => PersonModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "succeed": succeed,
        "message": message,
        "people": List<dynamic>.from(people.map((x) => x.toMap())),
      };

  @override
  PeopleDataEntity toEntity() {
    return PeopleDataEntity(
      succeed: succeed,
      message: message,
      people: people.toListEntity(),
      // people: people.map((e) => e.toEntity()).toList(),
    );
  }
}

class PersonModel extends BaseModel<PersonEntity> {
  PersonModel({
    required this.name,
    required this.age,
  });

  final String? name;
  final int? age;

  factory PersonModel.fromJson(String str) =>
      PersonModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PersonModel.fromMap(Map<String, dynamic> json) => PersonModel(
        name: stringV(json["name"]),
        age: numV(json["age"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "age": age,
      };

  @override
  PersonEntity toEntity() {
    return PersonEntity(name: name, age: age);
  }
}
