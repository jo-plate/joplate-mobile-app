// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupInput {
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get phonenumber => throw _privateConstructorUsedError;

  /// Create a copy of SignupInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupInputCopyWith<SignupInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupInputCopyWith<$Res> {
  factory $SignupInputCopyWith(
          SignupInput value, $Res Function(SignupInput) then) =
      _$SignupInputCopyWithImpl<$Res, SignupInput>;
  @useResult
  $Res call(
      {String displayName, String email, String password, String phonenumber});
}

/// @nodoc
class _$SignupInputCopyWithImpl<$Res, $Val extends SignupInput>
    implements $SignupInputCopyWith<$Res> {
  _$SignupInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? email = null,
    Object? password = null,
    Object? phonenumber = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phonenumber: null == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupInputImplCopyWith<$Res>
    implements $SignupInputCopyWith<$Res> {
  factory _$$SignupInputImplCopyWith(
          _$SignupInputImpl value, $Res Function(_$SignupInputImpl) then) =
      __$$SignupInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String displayName, String email, String password, String phonenumber});
}

/// @nodoc
class __$$SignupInputImplCopyWithImpl<$Res>
    extends _$SignupInputCopyWithImpl<$Res, _$SignupInputImpl>
    implements _$$SignupInputImplCopyWith<$Res> {
  __$$SignupInputImplCopyWithImpl(
      _$SignupInputImpl _value, $Res Function(_$SignupInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? email = null,
    Object? password = null,
    Object? phonenumber = null,
  }) {
    return _then(_$SignupInputImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phonenumber: null == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignupInputImpl extends _SignupInput {
  const _$SignupInputImpl(
      {required this.displayName,
      required this.email,
      required this.password,
      required this.phonenumber})
      : super._();

  @override
  final String displayName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phonenumber;

  @override
  String toString() {
    return 'SignupInput(displayName: $displayName, email: $email, password: $password, phonenumber: $phonenumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupInputImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phonenumber, phonenumber) ||
                other.phonenumber == phonenumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, displayName, email, password, phonenumber);

  /// Create a copy of SignupInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupInputImplCopyWith<_$SignupInputImpl> get copyWith =>
      __$$SignupInputImplCopyWithImpl<_$SignupInputImpl>(this, _$identity);
}

abstract class _SignupInput extends SignupInput {
  const factory _SignupInput(
      {required final String displayName,
      required final String email,
      required final String password,
      required final String phonenumber}) = _$SignupInputImpl;
  const _SignupInput._() : super._();

  @override
  String get displayName;
  @override
  String get email;
  @override
  String get password;
  @override
  String get phonenumber;

  /// Create a copy of SignupInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupInputImplCopyWith<_$SignupInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
