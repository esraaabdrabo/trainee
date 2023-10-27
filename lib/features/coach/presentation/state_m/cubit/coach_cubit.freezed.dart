// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoachState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() coachInitState,
    required TResult Function() coachLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        coachErrorState,
    required TResult Function(CoachesEntity coachesEntity) getCoachesState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? coachInitState,
    TResult? Function()? coachLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult? Function(CoachesEntity coachesEntity)? getCoachesState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? coachInitState,
    TResult Function()? coachLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult Function(CoachesEntity coachesEntity)? getCoachesState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoachInitState value) coachInitState,
    required TResult Function(CoachLoadingState value) coachLoadingState,
    required TResult Function(CoachErrorState value) coachErrorState,
    required TResult Function(GetCoachesState value) getCoachesState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoachInitState value)? coachInitState,
    TResult? Function(CoachLoadingState value)? coachLoadingState,
    TResult? Function(CoachErrorState value)? coachErrorState,
    TResult? Function(GetCoachesState value)? getCoachesState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoachInitState value)? coachInitState,
    TResult Function(CoachLoadingState value)? coachLoadingState,
    TResult Function(CoachErrorState value)? coachErrorState,
    TResult Function(GetCoachesState value)? getCoachesState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachStateCopyWith<$Res> {
  factory $CoachStateCopyWith(
          CoachState value, $Res Function(CoachState) then) =
      _$CoachStateCopyWithImpl<$Res, CoachState>;
}

/// @nodoc
class _$CoachStateCopyWithImpl<$Res, $Val extends CoachState>
    implements $CoachStateCopyWith<$Res> {
  _$CoachStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CoachInitStateCopyWith<$Res> {
  factory _$$CoachInitStateCopyWith(
          _$CoachInitState value, $Res Function(_$CoachInitState) then) =
      __$$CoachInitStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CoachInitStateCopyWithImpl<$Res>
    extends _$CoachStateCopyWithImpl<$Res, _$CoachInitState>
    implements _$$CoachInitStateCopyWith<$Res> {
  __$$CoachInitStateCopyWithImpl(
      _$CoachInitState _value, $Res Function(_$CoachInitState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CoachInitState implements CoachInitState {
  const _$CoachInitState();

  @override
  String toString() {
    return 'CoachState.coachInitState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CoachInitState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() coachInitState,
    required TResult Function() coachLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        coachErrorState,
    required TResult Function(CoachesEntity coachesEntity) getCoachesState,
  }) {
    return coachInitState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? coachInitState,
    TResult? Function()? coachLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult? Function(CoachesEntity coachesEntity)? getCoachesState,
  }) {
    return coachInitState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? coachInitState,
    TResult Function()? coachLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult Function(CoachesEntity coachesEntity)? getCoachesState,
    required TResult orElse(),
  }) {
    if (coachInitState != null) {
      return coachInitState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoachInitState value) coachInitState,
    required TResult Function(CoachLoadingState value) coachLoadingState,
    required TResult Function(CoachErrorState value) coachErrorState,
    required TResult Function(GetCoachesState value) getCoachesState,
  }) {
    return coachInitState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoachInitState value)? coachInitState,
    TResult? Function(CoachLoadingState value)? coachLoadingState,
    TResult? Function(CoachErrorState value)? coachErrorState,
    TResult? Function(GetCoachesState value)? getCoachesState,
  }) {
    return coachInitState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoachInitState value)? coachInitState,
    TResult Function(CoachLoadingState value)? coachLoadingState,
    TResult Function(CoachErrorState value)? coachErrorState,
    TResult Function(GetCoachesState value)? getCoachesState,
    required TResult orElse(),
  }) {
    if (coachInitState != null) {
      return coachInitState(this);
    }
    return orElse();
  }
}

abstract class CoachInitState implements CoachState {
  const factory CoachInitState() = _$CoachInitState;
}

/// @nodoc
abstract class _$$CoachLoadingStateCopyWith<$Res> {
  factory _$$CoachLoadingStateCopyWith(
          _$CoachLoadingState value, $Res Function(_$CoachLoadingState) then) =
      __$$CoachLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CoachLoadingStateCopyWithImpl<$Res>
    extends _$CoachStateCopyWithImpl<$Res, _$CoachLoadingState>
    implements _$$CoachLoadingStateCopyWith<$Res> {
  __$$CoachLoadingStateCopyWithImpl(
      _$CoachLoadingState _value, $Res Function(_$CoachLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CoachLoadingState implements CoachLoadingState {
  const _$CoachLoadingState();

  @override
  String toString() {
    return 'CoachState.coachLoadingState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CoachLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() coachInitState,
    required TResult Function() coachLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        coachErrorState,
    required TResult Function(CoachesEntity coachesEntity) getCoachesState,
  }) {
    return coachLoadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? coachInitState,
    TResult? Function()? coachLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult? Function(CoachesEntity coachesEntity)? getCoachesState,
  }) {
    return coachLoadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? coachInitState,
    TResult Function()? coachLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult Function(CoachesEntity coachesEntity)? getCoachesState,
    required TResult orElse(),
  }) {
    if (coachLoadingState != null) {
      return coachLoadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoachInitState value) coachInitState,
    required TResult Function(CoachLoadingState value) coachLoadingState,
    required TResult Function(CoachErrorState value) coachErrorState,
    required TResult Function(GetCoachesState value) getCoachesState,
  }) {
    return coachLoadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoachInitState value)? coachInitState,
    TResult? Function(CoachLoadingState value)? coachLoadingState,
    TResult? Function(CoachErrorState value)? coachErrorState,
    TResult? Function(GetCoachesState value)? getCoachesState,
  }) {
    return coachLoadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoachInitState value)? coachInitState,
    TResult Function(CoachLoadingState value)? coachLoadingState,
    TResult Function(CoachErrorState value)? coachErrorState,
    TResult Function(GetCoachesState value)? getCoachesState,
    required TResult orElse(),
  }) {
    if (coachLoadingState != null) {
      return coachLoadingState(this);
    }
    return orElse();
  }
}

abstract class CoachLoadingState implements CoachState {
  const factory CoachLoadingState() = _$CoachLoadingState;
}

/// @nodoc
abstract class _$$CoachErrorStateCopyWith<$Res> {
  factory _$$CoachErrorStateCopyWith(
          _$CoachErrorState value, $Res Function(_$CoachErrorState) then) =
      __$$CoachErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$CoachErrorStateCopyWithImpl<$Res>
    extends _$CoachStateCopyWithImpl<$Res, _$CoachErrorState>
    implements _$$CoachErrorStateCopyWith<$Res> {
  __$$CoachErrorStateCopyWithImpl(
      _$CoachErrorState _value, $Res Function(_$CoachErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
  }) {
    return _then(_$CoachErrorState(
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

class _$CoachErrorState implements CoachErrorState {
  const _$CoachErrorState(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'CoachState.coachErrorState(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachErrorState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachErrorStateCopyWith<_$CoachErrorState> get copyWith =>
      __$$CoachErrorStateCopyWithImpl<_$CoachErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() coachInitState,
    required TResult Function() coachLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        coachErrorState,
    required TResult Function(CoachesEntity coachesEntity) getCoachesState,
  }) {
    return coachErrorState(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? coachInitState,
    TResult? Function()? coachLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult? Function(CoachesEntity coachesEntity)? getCoachesState,
  }) {
    return coachErrorState?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? coachInitState,
    TResult Function()? coachLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult Function(CoachesEntity coachesEntity)? getCoachesState,
    required TResult orElse(),
  }) {
    if (coachErrorState != null) {
      return coachErrorState(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoachInitState value) coachInitState,
    required TResult Function(CoachLoadingState value) coachLoadingState,
    required TResult Function(CoachErrorState value) coachErrorState,
    required TResult Function(GetCoachesState value) getCoachesState,
  }) {
    return coachErrorState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoachInitState value)? coachInitState,
    TResult? Function(CoachLoadingState value)? coachLoadingState,
    TResult? Function(CoachErrorState value)? coachErrorState,
    TResult? Function(GetCoachesState value)? getCoachesState,
  }) {
    return coachErrorState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoachInitState value)? coachInitState,
    TResult Function(CoachLoadingState value)? coachLoadingState,
    TResult Function(CoachErrorState value)? coachErrorState,
    TResult Function(GetCoachesState value)? getCoachesState,
    required TResult orElse(),
  }) {
    if (coachErrorState != null) {
      return coachErrorState(this);
    }
    return orElse();
  }
}

abstract class CoachErrorState implements CoachState {
  const factory CoachErrorState(
      final AppErrors error, final VoidCallback callback) = _$CoachErrorState;

  AppErrors get error;
  VoidCallback get callback;
  @JsonKey(ignore: true)
  _$$CoachErrorStateCopyWith<_$CoachErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCoachesStateCopyWith<$Res> {
  factory _$$GetCoachesStateCopyWith(
          _$GetCoachesState value, $Res Function(_$GetCoachesState) then) =
      __$$GetCoachesStateCopyWithImpl<$Res>;
  @useResult
  $Res call({CoachesEntity coachesEntity});
}

/// @nodoc
class __$$GetCoachesStateCopyWithImpl<$Res>
    extends _$CoachStateCopyWithImpl<$Res, _$GetCoachesState>
    implements _$$GetCoachesStateCopyWith<$Res> {
  __$$GetCoachesStateCopyWithImpl(
      _$GetCoachesState _value, $Res Function(_$GetCoachesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coachesEntity = null,
  }) {
    return _then(_$GetCoachesState(
      null == coachesEntity
          ? _value.coachesEntity
          : coachesEntity // ignore: cast_nullable_to_non_nullable
              as CoachesEntity,
    ));
  }
}

/// @nodoc

class _$GetCoachesState implements GetCoachesState {
  const _$GetCoachesState(this.coachesEntity);

  @override
  final CoachesEntity coachesEntity;

  @override
  String toString() {
    return 'CoachState.getCoachesState(coachesEntity: $coachesEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCoachesState &&
            (identical(other.coachesEntity, coachesEntity) ||
                other.coachesEntity == coachesEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coachesEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCoachesStateCopyWith<_$GetCoachesState> get copyWith =>
      __$$GetCoachesStateCopyWithImpl<_$GetCoachesState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() coachInitState,
    required TResult Function() coachLoadingState,
    required TResult Function(AppErrors error, VoidCallback callback)
        coachErrorState,
    required TResult Function(CoachesEntity coachesEntity) getCoachesState,
  }) {
    return getCoachesState(coachesEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? coachInitState,
    TResult? Function()? coachLoadingState,
    TResult? Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult? Function(CoachesEntity coachesEntity)? getCoachesState,
  }) {
    return getCoachesState?.call(coachesEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? coachInitState,
    TResult Function()? coachLoadingState,
    TResult Function(AppErrors error, VoidCallback callback)? coachErrorState,
    TResult Function(CoachesEntity coachesEntity)? getCoachesState,
    required TResult orElse(),
  }) {
    if (getCoachesState != null) {
      return getCoachesState(coachesEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CoachInitState value) coachInitState,
    required TResult Function(CoachLoadingState value) coachLoadingState,
    required TResult Function(CoachErrorState value) coachErrorState,
    required TResult Function(GetCoachesState value) getCoachesState,
  }) {
    return getCoachesState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CoachInitState value)? coachInitState,
    TResult? Function(CoachLoadingState value)? coachLoadingState,
    TResult? Function(CoachErrorState value)? coachErrorState,
    TResult? Function(GetCoachesState value)? getCoachesState,
  }) {
    return getCoachesState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CoachInitState value)? coachInitState,
    TResult Function(CoachLoadingState value)? coachLoadingState,
    TResult Function(CoachErrorState value)? coachErrorState,
    TResult Function(GetCoachesState value)? getCoachesState,
    required TResult orElse(),
  }) {
    if (getCoachesState != null) {
      return getCoachesState(this);
    }
    return orElse();
  }
}

abstract class GetCoachesState implements CoachState {
  const factory GetCoachesState(final CoachesEntity coachesEntity) =
      _$GetCoachesState;

  CoachesEntity get coachesEntity;
  @JsonKey(ignore: true)
  _$$GetCoachesStateCopyWith<_$GetCoachesState> get copyWith =>
      throw _privateConstructorUsedError;
}
