// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AccountInitCopyWith<$Res> {
  factory _$$AccountInitCopyWith(
          _$AccountInit value, $Res Function(_$AccountInit) then) =
      __$$AccountInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountInitCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountInit>
    implements _$$AccountInitCopyWith<$Res> {
  __$$AccountInitCopyWithImpl(
      _$AccountInit _value, $Res Function(_$AccountInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountInit implements AccountInit {
  const _$AccountInit();

  @override
  String toString() {
    return 'AccountState.accountInit()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return accountInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return accountInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (accountInit != null) {
      return accountInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return accountInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return accountInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (accountInit != null) {
      return accountInit(this);
    }
    return orElse();
  }
}

abstract class AccountInit implements AccountState {
  const factory AccountInit() = _$AccountInit;
}

/// @nodoc
abstract class _$$AccountLoadingCopyWith<$Res> {
  factory _$$AccountLoadingCopyWith(
          _$AccountLoading value, $Res Function(_$AccountLoading) then) =
      __$$AccountLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountLoadingCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountLoading>
    implements _$$AccountLoadingCopyWith<$Res> {
  __$$AccountLoadingCopyWithImpl(
      _$AccountLoading _value, $Res Function(_$AccountLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountLoading implements AccountLoading {
  const _$AccountLoading();

  @override
  String toString() {
    return 'AccountState.accountLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return accountLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return accountLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (accountLoading != null) {
      return accountLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return accountLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return accountLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (accountLoading != null) {
      return accountLoading(this);
    }
    return orElse();
  }
}

abstract class AccountLoading implements AccountState {
  const factory AccountLoading() = _$AccountLoading;
}

/// @nodoc
abstract class _$$AccLoginLoadedCopyWith<$Res> {
  factory _$$AccLoginLoadedCopyWith(
          _$AccLoginLoaded value, $Res Function(_$AccLoginLoaded) then) =
      __$$AccLoginLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginEntity loginEntity});
}

/// @nodoc
class __$$AccLoginLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccLoginLoaded>
    implements _$$AccLoginLoadedCopyWith<$Res> {
  __$$AccLoginLoadedCopyWithImpl(
      _$AccLoginLoaded _value, $Res Function(_$AccLoginLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginEntity = null,
  }) {
    return _then(_$AccLoginLoaded(
      null == loginEntity
          ? _value.loginEntity
          : loginEntity // ignore: cast_nullable_to_non_nullable
              as LoginEntity,
    ));
  }
}

/// @nodoc

class _$AccLoginLoaded implements AccLoginLoaded {
  const _$AccLoginLoaded(this.loginEntity);

  @override
  final LoginEntity loginEntity;

  @override
  String toString() {
    return 'AccountState.loginLoaded(loginEntity: $loginEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccLoginLoaded &&
            (identical(other.loginEntity, loginEntity) ||
                other.loginEntity == loginEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccLoginLoadedCopyWith<_$AccLoginLoaded> get copyWith =>
      __$$AccLoginLoadedCopyWithImpl<_$AccLoginLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return loginLoaded(loginEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return loginLoaded?.call(loginEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (loginLoaded != null) {
      return loginLoaded(loginEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return loginLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return loginLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (loginLoaded != null) {
      return loginLoaded(this);
    }
    return orElse();
  }
}

abstract class AccLoginLoaded implements AccountState {
  const factory AccLoginLoaded(final LoginEntity loginEntity) =
      _$AccLoginLoaded;

  LoginEntity get loginEntity;
  @JsonKey(ignore: true)
  _$$AccLoginLoadedCopyWith<_$AccLoginLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccRegisterLoadedCopyWith<$Res> {
  factory _$$AccRegisterLoadedCopyWith(
          _$AccRegisterLoaded value, $Res Function(_$AccRegisterLoaded) then) =
      __$$AccRegisterLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterEntity registerEntity});
}

/// @nodoc
class __$$AccRegisterLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccRegisterLoaded>
    implements _$$AccRegisterLoadedCopyWith<$Res> {
  __$$AccRegisterLoadedCopyWithImpl(
      _$AccRegisterLoaded _value, $Res Function(_$AccRegisterLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerEntity = null,
  }) {
    return _then(_$AccRegisterLoaded(
      null == registerEntity
          ? _value.registerEntity
          : registerEntity // ignore: cast_nullable_to_non_nullable
              as RegisterEntity,
    ));
  }
}

/// @nodoc

class _$AccRegisterLoaded implements AccRegisterLoaded {
  const _$AccRegisterLoaded(this.registerEntity);

  @override
  final RegisterEntity registerEntity;

  @override
  String toString() {
    return 'AccountState.registerLoaded(registerEntity: $registerEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccRegisterLoaded &&
            (identical(other.registerEntity, registerEntity) ||
                other.registerEntity == registerEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, registerEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccRegisterLoadedCopyWith<_$AccRegisterLoaded> get copyWith =>
      __$$AccRegisterLoadedCopyWithImpl<_$AccRegisterLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return registerLoaded(registerEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return registerLoaded?.call(registerEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(registerEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return registerLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return registerLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(this);
    }
    return orElse();
  }
}

abstract class AccRegisterLoaded implements AccountState {
  const factory AccRegisterLoaded(final RegisterEntity registerEntity) =
      _$AccRegisterLoaded;

  RegisterEntity get registerEntity;
  @JsonKey(ignore: true)
  _$$AccRegisterLoadedCopyWith<_$AccRegisterLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccForgotPassLoadedCopyWith<$Res> {
  factory _$$AccForgotPassLoadedCopyWith(_$AccForgotPassLoaded value,
          $Res Function(_$AccForgotPassLoaded) then) =
      __$$AccForgotPassLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({AcknowledgeEntity acknowledgeEntity});
}

/// @nodoc
class __$$AccForgotPassLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccForgotPassLoaded>
    implements _$$AccForgotPassLoadedCopyWith<$Res> {
  __$$AccForgotPassLoadedCopyWithImpl(
      _$AccForgotPassLoaded _value, $Res Function(_$AccForgotPassLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acknowledgeEntity = null,
  }) {
    return _then(_$AccForgotPassLoaded(
      null == acknowledgeEntity
          ? _value.acknowledgeEntity
          : acknowledgeEntity // ignore: cast_nullable_to_non_nullable
              as AcknowledgeEntity,
    ));
  }
}

/// @nodoc

class _$AccForgotPassLoaded implements AccForgotPassLoaded {
  const _$AccForgotPassLoaded(this.acknowledgeEntity);

  @override
  final AcknowledgeEntity acknowledgeEntity;

  @override
  String toString() {
    return 'AccountState.forgotPasswordLoaded(acknowledgeEntity: $acknowledgeEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccForgotPassLoaded &&
            (identical(other.acknowledgeEntity, acknowledgeEntity) ||
                other.acknowledgeEntity == acknowledgeEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acknowledgeEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccForgotPassLoadedCopyWith<_$AccForgotPassLoaded> get copyWith =>
      __$$AccForgotPassLoadedCopyWithImpl<_$AccForgotPassLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return forgotPasswordLoaded(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return forgotPasswordLoaded?.call(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (forgotPasswordLoaded != null) {
      return forgotPasswordLoaded(acknowledgeEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return forgotPasswordLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return forgotPasswordLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (forgotPasswordLoaded != null) {
      return forgotPasswordLoaded(this);
    }
    return orElse();
  }
}

abstract class AccForgotPassLoaded implements AccountState {
  const factory AccForgotPassLoaded(final AcknowledgeEntity acknowledgeEntity) =
      _$AccForgotPassLoaded;

  AcknowledgeEntity get acknowledgeEntity;
  @JsonKey(ignore: true)
  _$$AccForgotPassLoadedCopyWith<_$AccForgotPassLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccCreateNewPassLoadedCopyWith<$Res> {
  factory _$$AccCreateNewPassLoadedCopyWith(_$AccCreateNewPassLoaded value,
          $Res Function(_$AccCreateNewPassLoaded) then) =
      __$$AccCreateNewPassLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({AcknowledgeEntity acknowledgeEntity});
}

/// @nodoc
class __$$AccCreateNewPassLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccCreateNewPassLoaded>
    implements _$$AccCreateNewPassLoadedCopyWith<$Res> {
  __$$AccCreateNewPassLoadedCopyWithImpl(_$AccCreateNewPassLoaded _value,
      $Res Function(_$AccCreateNewPassLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acknowledgeEntity = null,
  }) {
    return _then(_$AccCreateNewPassLoaded(
      null == acknowledgeEntity
          ? _value.acknowledgeEntity
          : acknowledgeEntity // ignore: cast_nullable_to_non_nullable
              as AcknowledgeEntity,
    ));
  }
}

/// @nodoc

class _$AccCreateNewPassLoaded implements AccCreateNewPassLoaded {
  const _$AccCreateNewPassLoaded(this.acknowledgeEntity);

  @override
  final AcknowledgeEntity acknowledgeEntity;

  @override
  String toString() {
    return 'AccountState.createNewPasswordLoaded(acknowledgeEntity: $acknowledgeEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccCreateNewPassLoaded &&
            (identical(other.acknowledgeEntity, acknowledgeEntity) ||
                other.acknowledgeEntity == acknowledgeEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acknowledgeEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccCreateNewPassLoadedCopyWith<_$AccCreateNewPassLoaded> get copyWith =>
      __$$AccCreateNewPassLoadedCopyWithImpl<_$AccCreateNewPassLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return createNewPasswordLoaded(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return createNewPasswordLoaded?.call(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (createNewPasswordLoaded != null) {
      return createNewPasswordLoaded(acknowledgeEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return createNewPasswordLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return createNewPasswordLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (createNewPasswordLoaded != null) {
      return createNewPasswordLoaded(this);
    }
    return orElse();
  }
}

abstract class AccCreateNewPassLoaded implements AccountState {
  const factory AccCreateNewPassLoaded(
      final AcknowledgeEntity acknowledgeEntity) = _$AccCreateNewPassLoaded;

  AcknowledgeEntity get acknowledgeEntity;
  @JsonKey(ignore: true)
  _$$AccCreateNewPassLoadedCopyWith<_$AccCreateNewPassLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccVerifyAccountLoadedCopyWith<$Res> {
  factory _$$AccVerifyAccountLoadedCopyWith(_$AccVerifyAccountLoaded value,
          $Res Function(_$AccVerifyAccountLoaded) then) =
      __$$AccVerifyAccountLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({AcknowledgeEntity acknowledgeEntity});
}

/// @nodoc
class __$$AccVerifyAccountLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccVerifyAccountLoaded>
    implements _$$AccVerifyAccountLoadedCopyWith<$Res> {
  __$$AccVerifyAccountLoadedCopyWithImpl(_$AccVerifyAccountLoaded _value,
      $Res Function(_$AccVerifyAccountLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acknowledgeEntity = null,
  }) {
    return _then(_$AccVerifyAccountLoaded(
      null == acknowledgeEntity
          ? _value.acknowledgeEntity
          : acknowledgeEntity // ignore: cast_nullable_to_non_nullable
              as AcknowledgeEntity,
    ));
  }
}

/// @nodoc

class _$AccVerifyAccountLoaded implements AccVerifyAccountLoaded {
  const _$AccVerifyAccountLoaded(this.acknowledgeEntity);

  @override
  final AcknowledgeEntity acknowledgeEntity;

  @override
  String toString() {
    return 'AccountState.verifyAccountLoaded(acknowledgeEntity: $acknowledgeEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccVerifyAccountLoaded &&
            (identical(other.acknowledgeEntity, acknowledgeEntity) ||
                other.acknowledgeEntity == acknowledgeEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acknowledgeEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccVerifyAccountLoadedCopyWith<_$AccVerifyAccountLoaded> get copyWith =>
      __$$AccVerifyAccountLoadedCopyWithImpl<_$AccVerifyAccountLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return verifyAccountLoaded(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return verifyAccountLoaded?.call(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (verifyAccountLoaded != null) {
      return verifyAccountLoaded(acknowledgeEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return verifyAccountLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return verifyAccountLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (verifyAccountLoaded != null) {
      return verifyAccountLoaded(this);
    }
    return orElse();
  }
}

abstract class AccVerifyAccountLoaded implements AccountState {
  const factory AccVerifyAccountLoaded(
      final AcknowledgeEntity acknowledgeEntity) = _$AccVerifyAccountLoaded;

  AcknowledgeEntity get acknowledgeEntity;
  @JsonKey(ignore: true)
  _$$AccVerifyAccountLoadedCopyWith<_$AccVerifyAccountLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccSendVCAccountLoadedCopyWith<$Res> {
  factory _$$AccSendVCAccountLoadedCopyWith(_$AccSendVCAccountLoaded value,
          $Res Function(_$AccSendVCAccountLoaded) then) =
      __$$AccSendVCAccountLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({AcknowledgeEntity acknowledgeEntity});
}

/// @nodoc
class __$$AccSendVCAccountLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccSendVCAccountLoaded>
    implements _$$AccSendVCAccountLoadedCopyWith<$Res> {
  __$$AccSendVCAccountLoadedCopyWithImpl(_$AccSendVCAccountLoaded _value,
      $Res Function(_$AccSendVCAccountLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acknowledgeEntity = null,
  }) {
    return _then(_$AccSendVCAccountLoaded(
      null == acknowledgeEntity
          ? _value.acknowledgeEntity
          : acknowledgeEntity // ignore: cast_nullable_to_non_nullable
              as AcknowledgeEntity,
    ));
  }
}

/// @nodoc

class _$AccSendVCAccountLoaded implements AccSendVCAccountLoaded {
  const _$AccSendVCAccountLoaded(this.acknowledgeEntity);

  @override
  final AcknowledgeEntity acknowledgeEntity;

  @override
  String toString() {
    return 'AccountState.sendVCLoaded(acknowledgeEntity: $acknowledgeEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccSendVCAccountLoaded &&
            (identical(other.acknowledgeEntity, acknowledgeEntity) ||
                other.acknowledgeEntity == acknowledgeEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acknowledgeEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccSendVCAccountLoadedCopyWith<_$AccSendVCAccountLoaded> get copyWith =>
      __$$AccSendVCAccountLoadedCopyWithImpl<_$AccSendVCAccountLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return sendVCLoaded(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return sendVCLoaded?.call(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (sendVCLoaded != null) {
      return sendVCLoaded(acknowledgeEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return sendVCLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return sendVCLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (sendVCLoaded != null) {
      return sendVCLoaded(this);
    }
    return orElse();
  }
}

abstract class AccSendVCAccountLoaded implements AccountState {
  const factory AccSendVCAccountLoaded(
      final AcknowledgeEntity acknowledgeEntity) = _$AccSendVCAccountLoaded;

  AcknowledgeEntity get acknowledgeEntity;
  @JsonKey(ignore: true)
  _$$AccSendVCAccountLoadedCopyWith<_$AccSendVCAccountLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountErrorCopyWith<$Res> {
  factory _$$AccountErrorCopyWith(
          _$AccountError value, $Res Function(_$AccountError) then) =
      __$$AccountErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$AccountErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountError>
    implements _$$AccountErrorCopyWith<$Res> {
  __$$AccountErrorCopyWithImpl(
      _$AccountError _value, $Res Function(_$AccountError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
  }) {
    return _then(_$AccountError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrors,
      null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppErrorsCopyWith<$Res> get error {
    return $AppErrorsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$AccountError implements AccountError {
  const _$AccountError(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'AccountState.accountError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountError &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountErrorCopyWith<_$AccountError> get copyWith =>
      __$$AccountErrorCopyWithImpl<_$AccountError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return accountError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return accountError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (accountError != null) {
      return accountError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return accountError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return accountError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (accountError != null) {
      return accountError(this);
    }
    return orElse();
  }
}

abstract class AccountError implements AccountState {
  const factory AccountError(
      final AppErrors error, final VoidCallback callback) = _$AccountError;

  AppErrors get error;
  VoidCallback get callback;
  @JsonKey(ignore: true)
  _$$AccountErrorCopyWith<_$AccountError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccChangePassLoadedCopyWith<$Res> {
  factory _$$AccChangePassLoadedCopyWith(_$AccChangePassLoaded value,
          $Res Function(_$AccChangePassLoaded) then) =
      __$$AccChangePassLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({AcknowledgeEntity acknowledgeEntity});
}

/// @nodoc
class __$$AccChangePassLoadedCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccChangePassLoaded>
    implements _$$AccChangePassLoadedCopyWith<$Res> {
  __$$AccChangePassLoadedCopyWithImpl(
      _$AccChangePassLoaded _value, $Res Function(_$AccChangePassLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acknowledgeEntity = null,
  }) {
    return _then(_$AccChangePassLoaded(
      null == acknowledgeEntity
          ? _value.acknowledgeEntity
          : acknowledgeEntity // ignore: cast_nullable_to_non_nullable
              as AcknowledgeEntity,
    ));
  }
}

/// @nodoc

class _$AccChangePassLoaded implements AccChangePassLoaded {
  const _$AccChangePassLoaded(this.acknowledgeEntity);

  @override
  final AcknowledgeEntity acknowledgeEntity;

  @override
  String toString() {
    return 'AccountState.changePasswordLoaded(acknowledgeEntity: $acknowledgeEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccChangePassLoaded &&
            (identical(other.acknowledgeEntity, acknowledgeEntity) ||
                other.acknowledgeEntity == acknowledgeEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acknowledgeEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccChangePassLoadedCopyWith<_$AccChangePassLoaded> get copyWith =>
      __$$AccChangePassLoadedCopyWithImpl<_$AccChangePassLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        forgotPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        createNewPasswordLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        verifyAccountLoaded,
    required TResult Function(AcknowledgeEntity acknowledgeEntity) sendVCLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function(AcknowledgeEntity acknowledgeEntity)
        changePasswordLoaded,
  }) {
    return changePasswordLoaded(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        forgotPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function(AcknowledgeEntity acknowledgeEntity)?
        changePasswordLoaded,
  }) {
    return changePasswordLoaded?.call(acknowledgeEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? forgotPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)?
        createNewPasswordLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? verifyAccountLoaded,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? sendVCLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function(AcknowledgeEntity acknowledgeEntity)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (changePasswordLoaded != null) {
      return changePasswordLoaded(acknowledgeEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccForgotPassLoaded value) forgotPasswordLoaded,
    required TResult Function(AccCreateNewPassLoaded value)
        createNewPasswordLoaded,
    required TResult Function(AccVerifyAccountLoaded value) verifyAccountLoaded,
    required TResult Function(AccSendVCAccountLoaded value) sendVCLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(AccChangePassLoaded value) changePasswordLoaded,
  }) {
    return changePasswordLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult? Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult? Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult? Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(AccChangePassLoaded value)? changePasswordLoaded,
  }) {
    return changePasswordLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccForgotPassLoaded value)? forgotPasswordLoaded,
    TResult Function(AccCreateNewPassLoaded value)? createNewPasswordLoaded,
    TResult Function(AccVerifyAccountLoaded value)? verifyAccountLoaded,
    TResult Function(AccSendVCAccountLoaded value)? sendVCLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(AccChangePassLoaded value)? changePasswordLoaded,
    required TResult orElse(),
  }) {
    if (changePasswordLoaded != null) {
      return changePasswordLoaded(this);
    }
    return orElse();
  }
}

abstract class AccChangePassLoaded implements AccountState {
  const factory AccChangePassLoaded(final AcknowledgeEntity acknowledgeEntity) =
      _$AccChangePassLoaded;

  AcknowledgeEntity get acknowledgeEntity;
  @JsonKey(ignore: true)
  _$$AccChangePassLoadedCopyWith<_$AccChangePassLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
