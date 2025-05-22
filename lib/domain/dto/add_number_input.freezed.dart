// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_number_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddPlateNumberInput {
  String get code => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int? get discountPrice => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Create a copy of AddPlateNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPlateNumberInputCopyWith<AddPlateNumberInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPlateNumberInputCopyWith<$Res> {
  factory $AddPlateNumberInputCopyWith(
          AddPlateNumberInput value, $Res Function(AddPlateNumberInput) then) =
      _$AddPlateNumberInputCopyWithImpl<$Res, AddPlateNumberInput>;
  @useResult
  $Res call(
      {String code,
      String number,
      int price,
      int? discountPrice,
      bool isFeatured,
      String? description});
}

/// @nodoc
class _$AddPlateNumberInputCopyWithImpl<$Res, $Val extends AddPlateNumberInput>
    implements $AddPlateNumberInputCopyWith<$Res> {
  _$AddPlateNumberInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPlateNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? number = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? isFeatured = null,
    Object? description = freezed,
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
              as int,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPlateNumberInputImplCopyWith<$Res>
    implements $AddPlateNumberInputCopyWith<$Res> {
  factory _$$AddPlateNumberInputImplCopyWith(_$AddPlateNumberInputImpl value,
          $Res Function(_$AddPlateNumberInputImpl) then) =
      __$$AddPlateNumberInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String number,
      int price,
      int? discountPrice,
      bool isFeatured,
      String? description});
}

/// @nodoc
class __$$AddPlateNumberInputImplCopyWithImpl<$Res>
    extends _$AddPlateNumberInputCopyWithImpl<$Res, _$AddPlateNumberInputImpl>
    implements _$$AddPlateNumberInputImplCopyWith<$Res> {
  __$$AddPlateNumberInputImplCopyWithImpl(_$AddPlateNumberInputImpl _value,
      $Res Function(_$AddPlateNumberInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPlateNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? number = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? isFeatured = null,
    Object? description = freezed,
  }) {
    return _then(_$AddPlateNumberInputImpl(
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
              as int,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddPlateNumberInputImpl implements _AddPlateNumberInput {
  const _$AddPlateNumberInputImpl(
      {required this.code,
      required this.number,
      required this.price,
      this.discountPrice,
      this.isFeatured = false,
      this.description});

  @override
  final String code;
  @override
  final String number;
  @override
  final int price;
  @override
  final int? discountPrice;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  final String? description;

  @override
  String toString() {
    return 'AddPlateNumberInput(code: $code, number: $number, price: $price, discountPrice: $discountPrice, isFeatured: $isFeatured, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPlateNumberInputImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, number, price, discountPrice, isFeatured, description);

  /// Create a copy of AddPlateNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPlateNumberInputImplCopyWith<_$AddPlateNumberInputImpl> get copyWith =>
      __$$AddPlateNumberInputImplCopyWithImpl<_$AddPlateNumberInputImpl>(
          this, _$identity);
}

abstract class _AddPlateNumberInput implements AddPlateNumberInput {
  const factory _AddPlateNumberInput(
      {required final String code,
      required final String number,
      required final int price,
      final int? discountPrice,
      final bool isFeatured,
      final String? description}) = _$AddPlateNumberInputImpl;

  @override
  String get code;
  @override
  String get number;
  @override
  int get price;
  @override
  int? get discountPrice;
  @override
  bool get isFeatured;
  @override
  String? get description;

  /// Create a copy of AddPlateNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPlateNumberInputImplCopyWith<_$AddPlateNumberInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddPhoneNumberInput {
  String get number => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int? get discountPrice => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Create a copy of AddPhoneNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPhoneNumberInputCopyWith<AddPhoneNumberInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPhoneNumberInputCopyWith<$Res> {
  factory $AddPhoneNumberInputCopyWith(
          AddPhoneNumberInput value, $Res Function(AddPhoneNumberInput) then) =
      _$AddPhoneNumberInputCopyWithImpl<$Res, AddPhoneNumberInput>;
  @useResult
  $Res call(
      {String number,
      int price,
      int? discountPrice,
      bool isFeatured,
      String? description});
}

/// @nodoc
class _$AddPhoneNumberInputCopyWithImpl<$Res, $Val extends AddPhoneNumberInput>
    implements $AddPhoneNumberInputCopyWith<$Res> {
  _$AddPhoneNumberInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPhoneNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? isFeatured = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPhoneNumberInputImplCopyWith<$Res>
    implements $AddPhoneNumberInputCopyWith<$Res> {
  factory _$$AddPhoneNumberInputImplCopyWith(_$AddPhoneNumberInputImpl value,
          $Res Function(_$AddPhoneNumberInputImpl) then) =
      __$$AddPhoneNumberInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String number,
      int price,
      int? discountPrice,
      bool isFeatured,
      String? description});
}

/// @nodoc
class __$$AddPhoneNumberInputImplCopyWithImpl<$Res>
    extends _$AddPhoneNumberInputCopyWithImpl<$Res, _$AddPhoneNumberInputImpl>
    implements _$$AddPhoneNumberInputImplCopyWith<$Res> {
  __$$AddPhoneNumberInputImplCopyWithImpl(_$AddPhoneNumberInputImpl _value,
      $Res Function(_$AddPhoneNumberInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPhoneNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? isFeatured = null,
    Object? description = freezed,
  }) {
    return _then(_$AddPhoneNumberInputImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddPhoneNumberInputImpl implements _AddPhoneNumberInput {
  const _$AddPhoneNumberInputImpl(
      {required this.number,
      required this.price,
      this.discountPrice,
      this.isFeatured = false,
      this.description});

  @override
  final String number;
  @override
  final int price;
  @override
  final int? discountPrice;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  final String? description;

  @override
  String toString() {
    return 'AddPhoneNumberInput(number: $number, price: $price, discountPrice: $discountPrice, isFeatured: $isFeatured, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPhoneNumberInputImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, number, price, discountPrice, isFeatured, description);

  /// Create a copy of AddPhoneNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPhoneNumberInputImplCopyWith<_$AddPhoneNumberInputImpl> get copyWith =>
      __$$AddPhoneNumberInputImplCopyWithImpl<_$AddPhoneNumberInputImpl>(
          this, _$identity);
}

abstract class _AddPhoneNumberInput implements AddPhoneNumberInput {
  const factory _AddPhoneNumberInput(
      {required final String number,
      required final int price,
      final int? discountPrice,
      final bool isFeatured,
      final String? description}) = _$AddPhoneNumberInputImpl;

  @override
  String get number;
  @override
  int get price;
  @override
  int? get discountPrice;
  @override
  bool get isFeatured;
  @override
  String? get description;

  /// Create a copy of AddPhoneNumberInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPhoneNumberInputImplCopyWith<_$AddPhoneNumberInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
