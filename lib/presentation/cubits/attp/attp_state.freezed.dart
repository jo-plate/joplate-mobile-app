// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ATPPState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorized,
    TResult? Function()? denied,
    TResult? Function()? notDetermined,
    TResult? Function()? restricted,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Denied value)? denied,
    TResult? Function(_NotDetermined value)? notDetermined,
    TResult? Function(_Restricted value)? restricted,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ATPPStateCopyWith<$Res> {
  factory $ATPPStateCopyWith(ATPPState value, $Res Function(ATPPState) then) =
      _$ATPPStateCopyWithImpl<$Res, ATPPState>;
}

/// @nodoc
class _$ATPPStateCopyWithImpl<$Res, $Val extends ATPPState>
    implements $ATPPStateCopyWith<$Res> {
  _$ATPPStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ATPPStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ATPPState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorized,
    TResult? Function()? denied,
    TResult? Function()? notDetermined,
    TResult? Function()? restricted,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Denied value)? denied,
    TResult? Function(_NotDetermined value)? notDetermined,
    TResult? Function(_Restricted value)? restricted,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ATPPState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AuthorizedImplCopyWith<$Res> {
  factory _$$AuthorizedImplCopyWith(
          _$AuthorizedImpl value, $Res Function(_$AuthorizedImpl) then) =
      __$$AuthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorizedImplCopyWithImpl<$Res>
    extends _$ATPPStateCopyWithImpl<$Res, _$AuthorizedImpl>
    implements _$$AuthorizedImplCopyWith<$Res> {
  __$$AuthorizedImplCopyWithImpl(
      _$AuthorizedImpl _value, $Res Function(_$AuthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthorizedImpl implements _Authorized {
  const _$AuthorizedImpl();

  @override
  String toString() {
    return 'ATPPState.authorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
    required TResult Function(String message) error,
  }) {
    return authorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorized,
    TResult? Function()? denied,
    TResult? Function()? notDetermined,
    TResult? Function()? restricted,
    TResult? Function(String message)? error,
  }) {
    return authorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
    required TResult Function(_Error value) error,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Denied value)? denied,
    TResult? Function(_NotDetermined value)? notDetermined,
    TResult? Function(_Restricted value)? restricted,
    TResult? Function(_Error value)? error,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _Authorized implements ATPPState {
  const factory _Authorized() = _$AuthorizedImpl;
}

/// @nodoc
abstract class _$$DeniedImplCopyWith<$Res> {
  factory _$$DeniedImplCopyWith(
          _$DeniedImpl value, $Res Function(_$DeniedImpl) then) =
      __$$DeniedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeniedImplCopyWithImpl<$Res>
    extends _$ATPPStateCopyWithImpl<$Res, _$DeniedImpl>
    implements _$$DeniedImplCopyWith<$Res> {
  __$$DeniedImplCopyWithImpl(
      _$DeniedImpl _value, $Res Function(_$DeniedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeniedImpl implements _Denied {
  const _$DeniedImpl();

  @override
  String toString() {
    return 'ATPPState.denied()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeniedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
    required TResult Function(String message) error,
  }) {
    return denied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorized,
    TResult? Function()? denied,
    TResult? Function()? notDetermined,
    TResult? Function()? restricted,
    TResult? Function(String message)? error,
  }) {
    return denied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (denied != null) {
      return denied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
    required TResult Function(_Error value) error,
  }) {
    return denied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Denied value)? denied,
    TResult? Function(_NotDetermined value)? notDetermined,
    TResult? Function(_Restricted value)? restricted,
    TResult? Function(_Error value)? error,
  }) {
    return denied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (denied != null) {
      return denied(this);
    }
    return orElse();
  }
}

abstract class _Denied implements ATPPState {
  const factory _Denied() = _$DeniedImpl;
}

/// @nodoc
abstract class _$$NotDeterminedImplCopyWith<$Res> {
  factory _$$NotDeterminedImplCopyWith(
          _$NotDeterminedImpl value, $Res Function(_$NotDeterminedImpl) then) =
      __$$NotDeterminedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotDeterminedImplCopyWithImpl<$Res>
    extends _$ATPPStateCopyWithImpl<$Res, _$NotDeterminedImpl>
    implements _$$NotDeterminedImplCopyWith<$Res> {
  __$$NotDeterminedImplCopyWithImpl(
      _$NotDeterminedImpl _value, $Res Function(_$NotDeterminedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotDeterminedImpl implements _NotDetermined {
  const _$NotDeterminedImpl();

  @override
  String toString() {
    return 'ATPPState.notDetermined()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotDeterminedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
    required TResult Function(String message) error,
  }) {
    return notDetermined();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorized,
    TResult? Function()? denied,
    TResult? Function()? notDetermined,
    TResult? Function()? restricted,
    TResult? Function(String message)? error,
  }) {
    return notDetermined?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (notDetermined != null) {
      return notDetermined();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
    required TResult Function(_Error value) error,
  }) {
    return notDetermined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Denied value)? denied,
    TResult? Function(_NotDetermined value)? notDetermined,
    TResult? Function(_Restricted value)? restricted,
    TResult? Function(_Error value)? error,
  }) {
    return notDetermined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (notDetermined != null) {
      return notDetermined(this);
    }
    return orElse();
  }
}

abstract class _NotDetermined implements ATPPState {
  const factory _NotDetermined() = _$NotDeterminedImpl;
}

/// @nodoc
abstract class _$$RestrictedImplCopyWith<$Res> {
  factory _$$RestrictedImplCopyWith(
          _$RestrictedImpl value, $Res Function(_$RestrictedImpl) then) =
      __$$RestrictedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestrictedImplCopyWithImpl<$Res>
    extends _$ATPPStateCopyWithImpl<$Res, _$RestrictedImpl>
    implements _$$RestrictedImplCopyWith<$Res> {
  __$$RestrictedImplCopyWithImpl(
      _$RestrictedImpl _value, $Res Function(_$RestrictedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RestrictedImpl implements _Restricted {
  const _$RestrictedImpl();

  @override
  String toString() {
    return 'ATPPState.restricted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RestrictedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
    required TResult Function(String message) error,
  }) {
    return restricted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorized,
    TResult? Function()? denied,
    TResult? Function()? notDetermined,
    TResult? Function()? restricted,
    TResult? Function(String message)? error,
  }) {
    return restricted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (restricted != null) {
      return restricted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
    required TResult Function(_Error value) error,
  }) {
    return restricted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Denied value)? denied,
    TResult? Function(_NotDetermined value)? notDetermined,
    TResult? Function(_Restricted value)? restricted,
    TResult? Function(_Error value)? error,
  }) {
    return restricted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (restricted != null) {
      return restricted(this);
    }
    return orElse();
  }
}

abstract class _Restricted implements ATPPState {
  const factory _Restricted() = _$RestrictedImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ATPPStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ATPPState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authorized,
    TResult? Function()? denied,
    TResult? Function()? notDetermined,
    TResult? Function()? restricted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authorized value)? authorized,
    TResult? Function(_Denied value)? denied,
    TResult? Function(_NotDetermined value)? notDetermined,
    TResult? Function(_Restricted value)? restricted,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ATPPState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ATPPState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
