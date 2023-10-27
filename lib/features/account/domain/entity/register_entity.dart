



import '../../../../core/entities/base_entity.dart';

class RegisterEntity extends BaseEntity{
  RegisterEntity({
    this.canLogin,
  });

  final bool? canLogin;

  @override
  // TODO: implement props
  List<Object?> get props => [
    this.canLogin
  ];
}
