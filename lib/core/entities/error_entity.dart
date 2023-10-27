import 'base_entity.dart';

class ErrorEntity extends BaseEntity{
  ErrorEntity({
    this.code,
    this.message,
    this.details,
    this.validationErrors,
  });

  final int? code;
  final String? message;
  final String? details;
  final dynamic validationErrors;

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.code,
    this.message,
    this.details,
    this.validationErrors,
  ];
}