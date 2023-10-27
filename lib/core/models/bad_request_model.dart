import 'dart:convert';

import '../../core/entities/base_entity.dart';
import 'base_model.dart';


class AddAddressRequest extends BaseModel{
  AddAddressRequest({
    this.validationErrors,
  });

  final List<ValidationError>? validationErrors;

  factory AddAddressRequest.fromJson(String str) => AddAddressRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddAddressRequest.fromMap(Map<String, dynamic> json) => AddAddressRequest(
    validationErrors: json["validationErrors"] == null ? null : List<ValidationError>.from(json["validationErrors"].map((x) => ValidationError.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "validationErrors": validationErrors == null ? null : List<dynamic>.from(validationErrors?.map((x) => x.toMap()) ?? []),
  };

  @override
  BaseEntity toEntity() {
    throw UnimplementedError();
  }
}

class ValidationError extends BaseModel{
  ValidationError({
    this.field,
    this.erros,
  });

  final String? field;
  final List<String>? erros;

  factory ValidationError.fromJson(String str) => ValidationError.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValidationError.fromMap(Map<String, dynamic> json) => ValidationError(
    field: json["field"] == null ? null : json["field"],
    erros: json["erros"] == null ? null : List<String>.from(json["erros"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "field": field == null ? null : field,
    "erros": erros == null ? null : List<dynamic>.from(erros?.map((x) => x) ?? []),
  };

  @override
  BaseEntity toEntity() {
    throw UnimplementedError();
  }
}
