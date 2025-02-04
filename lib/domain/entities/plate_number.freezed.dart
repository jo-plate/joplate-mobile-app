// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plate_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlateNumber {
  String get code => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  /// Create a copy of PlateNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlateNumberCopyWith<PlateNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlateNumberCopyWith<$Res> {
  factory $PlateNumberCopyWith(
          PlateNumber value, $Res Function(PlateNumber) then) =
      _$PlateNumberCopyWithImpl<$Res, PlateNumber>;
  @useResult
  $Res call({String code, String number, String price});
}

/// @nodoc
class _$PlateNumberCopyWithImpl<$Res, $Val extends PlateNumber>
    implements $PlateNumberCopyWith<$Res> {
  _$PlateNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlateNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? number = null,
    Object? price = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlateNumberImplCopyWith<$Res>
    implements $PlateNumberCopyWith<$Res> {
  factory _$$PlateNumberImplCopyWith(
          _$PlateNumberImpl value, $Res Function(_$PlateNumberImpl) then) =
      __$$PlateNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String number, String price});
}

/// @nodoc
class __$$PlateNumberImplCopyWithImpl<$Res>
    extends _$PlateNumberCopyWithImpl<$Res, _$PlateNumberImpl>
    implements _$$PlateNumberImplCopyWith<$Res> {
  __$$PlateNumberImplCopyWithImpl(
      _$PlateNumberImpl _value, $Res Function(_$PlateNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlateNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? number = null,
    Object? price = null,
  }) {
    return _then(_$PlateNumberImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlateNumberImpl extends _PlateNumber {
  const _$PlateNumberImpl(
      {required this.code, required this.number, required this.price})
      : super._();

  @override
  final String code;
  @override
  final String number;
  @override
  final String price;

  @override
  String toString() {
    return 'PlateNumber(code: $code, number: $number, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlateNumberImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, number, price);

  /// Create a copy of PlateNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlateNumberImplCopyWith<_$PlateNumberImpl> get copyWith =>
      __$$PlateNumberImplCopyWithImpl<_$PlateNumberImpl>(this, _$identity);
}

abstract class _PlateNumber extends PlateNumber {
  const factory _PlateNumber(
      {required final String code,
      required final String number,
      required final String price}) = _$PlateNumberImpl;
  const _PlateNumber._() : super._();

  @override
  String get code;
  @override
  String get number;
  @override
  String get price;

  /// Create a copy of PlateNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlateNumberImplCopyWith<_$PlateNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
