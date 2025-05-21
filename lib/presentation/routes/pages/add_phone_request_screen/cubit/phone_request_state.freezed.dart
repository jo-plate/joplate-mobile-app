// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhoneRequestState {
  String get phoneNumber =>
      throw _privateConstructorUsedError; // required field
  String? get price => throw _privateConstructorUsedError; // optional
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of PhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneRequestStateCopyWith<PhoneRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneRequestStateCopyWith<$Res> {
  factory $PhoneRequestStateCopyWith(
          PhoneRequestState value, $Res Function(PhoneRequestState) then) =
      _$PhoneRequestStateCopyWithImpl<$Res, PhoneRequestState>;
  @useResult
  $Res call(
      {String phoneNumber,
      String? price,
      bool isSubmitting,
      String? errorMessage,
      String description});
}

/// @nodoc
class _$PhoneRequestStateCopyWithImpl<$Res, $Val extends PhoneRequestState>
    implements $PhoneRequestStateCopyWith<$Res> {
  _$PhoneRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? price = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneRequestStateImplCopyWith<$Res>
    implements $PhoneRequestStateCopyWith<$Res> {
  factory _$$PhoneRequestStateImplCopyWith(_$PhoneRequestStateImpl value,
          $Res Function(_$PhoneRequestStateImpl) then) =
      __$$PhoneRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String? price,
      bool isSubmitting,
      String? errorMessage,
      String description});
}

/// @nodoc
class __$$PhoneRequestStateImplCopyWithImpl<$Res>
    extends _$PhoneRequestStateCopyWithImpl<$Res, _$PhoneRequestStateImpl>
    implements _$$PhoneRequestStateImplCopyWith<$Res> {
  __$$PhoneRequestStateImplCopyWithImpl(_$PhoneRequestStateImpl _value,
      $Res Function(_$PhoneRequestStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? price = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
    Object? description = null,
  }) {
    return _then(_$PhoneRequestStateImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneRequestStateImpl implements _PhoneRequestState {
  const _$PhoneRequestStateImpl(
      {this.phoneNumber = '',
      this.price,
      this.isSubmitting = false,
      this.errorMessage,
      this.description = ''});

  @override
  @JsonKey()
  final String phoneNumber;
// required field
  @override
  final String? price;
// optional
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'PhoneRequestState(phoneNumber: $phoneNumber, price: $price, isSubmitting: $isSubmitting, errorMessage: $errorMessage, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneRequestStateImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, phoneNumber, price, isSubmitting, errorMessage, description);

  /// Create a copy of PhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneRequestStateImplCopyWith<_$PhoneRequestStateImpl> get copyWith =>
      __$$PhoneRequestStateImplCopyWithImpl<_$PhoneRequestStateImpl>(
          this, _$identity);
}

abstract class _PhoneRequestState implements PhoneRequestState {
  const factory _PhoneRequestState(
      {final String phoneNumber,
      final String? price,
      final bool isSubmitting,
      final String? errorMessage,
      final String description}) = _$PhoneRequestStateImpl;

  @override
  String get phoneNumber; // required field
  @override
  String? get price; // optional
  @override
  bool get isSubmitting;
  @override
  String? get errorMessage;
  @override
  String get description;

  /// Create a copy of PhoneRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneRequestStateImplCopyWith<_$PhoneRequestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
