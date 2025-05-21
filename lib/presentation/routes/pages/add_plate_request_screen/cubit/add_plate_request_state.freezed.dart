// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_plate_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlateRequestState {
  String get code => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError; // optional
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Create a copy of PlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlateRequestStateCopyWith<PlateRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlateRequestStateCopyWith<$Res> {
  factory $PlateRequestStateCopyWith(
          PlateRequestState value, $Res Function(PlateRequestState) then) =
      _$PlateRequestStateCopyWithImpl<$Res, PlateRequestState>;
  @useResult
  $Res call(
      {String code,
      String number,
      int? price,
      bool isSubmitting,
      String? errorMessage,
      String description});
}

/// @nodoc
class _$PlateRequestStateCopyWithImpl<$Res, $Val extends PlateRequestState>
    implements $PlateRequestStateCopyWith<$Res> {
  _$PlateRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? number = null,
    Object? price = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$PlateRequestStateImplCopyWith<$Res>
    implements $PlateRequestStateCopyWith<$Res> {
  factory _$$PlateRequestStateImplCopyWith(_$PlateRequestStateImpl value,
          $Res Function(_$PlateRequestStateImpl) then) =
      __$$PlateRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String number,
      int? price,
      bool isSubmitting,
      String? errorMessage,
      String description});
}

/// @nodoc
class __$$PlateRequestStateImplCopyWithImpl<$Res>
    extends _$PlateRequestStateCopyWithImpl<$Res, _$PlateRequestStateImpl>
    implements _$$PlateRequestStateImplCopyWith<$Res> {
  __$$PlateRequestStateImplCopyWithImpl(_$PlateRequestStateImpl _value,
      $Res Function(_$PlateRequestStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? number = null,
    Object? price = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
    Object? description = null,
  }) {
    return _then(_$PlateRequestStateImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
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

class _$PlateRequestStateImpl implements _PlateRequestState {
  const _$PlateRequestStateImpl(
      {this.code = '',
      this.number = '',
      this.price,
      this.isSubmitting = false,
      this.errorMessage,
      this.description = ''});

  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String number;
  @override
  final int? price;
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
    return 'PlateRequestState(code: $code, number: $number, price: $price, isSubmitting: $isSubmitting, errorMessage: $errorMessage, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlateRequestStateImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, number, price,
      isSubmitting, errorMessage, description);

  /// Create a copy of PlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlateRequestStateImplCopyWith<_$PlateRequestStateImpl> get copyWith =>
      __$$PlateRequestStateImplCopyWithImpl<_$PlateRequestStateImpl>(
          this, _$identity);
}

abstract class _PlateRequestState implements PlateRequestState {
  const factory _PlateRequestState(
      {final String code,
      final String number,
      final int? price,
      final bool isSubmitting,
      final String? errorMessage,
      final String description}) = _$PlateRequestStateImpl;

  @override
  String get code;
  @override
  String get number;
  @override
  int? get price; // optional
  @override
  bool get isSubmitting;
  @override
  String? get errorMessage;
  @override
  String get description;

  /// Create a copy of PlateRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlateRequestStateImplCopyWith<_$PlateRequestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
