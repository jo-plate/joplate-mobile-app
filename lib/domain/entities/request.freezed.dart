// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Request<T> _$RequestFromJson<T>(Map<String, dynamic> json) {
  return _Request<T>.fromJson(json);
}

/// @nodoc
mixin _$Request<T> {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  bool get priceHidden => throw _privateConstructorUsedError;
  bool get isSold => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  PhoneNumber? get phoneNumber => throw _privateConstructorUsedError;
  PlateNumber? get plateNumber => throw _privateConstructorUsedError;

  /// Serializes this Request to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestCopyWith<T, Request<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<T, $Res> {
  factory $RequestCopyWith(Request<T> value, $Res Function(Request<T>) then) =
      _$RequestCopyWithImpl<T, $Res, Request<T>>;
  @useResult
  $Res call(
      {String id,
      double price,
      ItemType itemType,
      bool priceHidden,
      bool isSold,
      String userId,
      PhoneNumber? phoneNumber,
      PlateNumber? plateNumber});

  $PhoneNumberCopyWith<$Res>? get phoneNumber;
  $PlateNumberCopyWith<$Res>? get plateNumber;
}

/// @nodoc
class _$RequestCopyWithImpl<T, $Res, $Val extends Request<T>>
    implements $RequestCopyWith<T, $Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? itemType = null,
    Object? priceHidden = null,
    Object? isSold = null,
    Object? userId = null,
    Object? phoneNumber = freezed,
    Object? plateNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      priceHidden: null == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as PlateNumber?,
    ) as $Val);
  }

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhoneNumberCopyWith<$Res>? get phoneNumber {
    if (_value.phoneNumber == null) {
      return null;
    }

    return $PhoneNumberCopyWith<$Res>(_value.phoneNumber!, (value) {
      return _then(_value.copyWith(phoneNumber: value) as $Val);
    });
  }

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlateNumberCopyWith<$Res>? get plateNumber {
    if (_value.plateNumber == null) {
      return null;
    }

    return $PlateNumberCopyWith<$Res>(_value.plateNumber!, (value) {
      return _then(_value.copyWith(plateNumber: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestImplCopyWith<T, $Res>
    implements $RequestCopyWith<T, $Res> {
  factory _$$RequestImplCopyWith(
          _$RequestImpl<T> value, $Res Function(_$RequestImpl<T>) then) =
      __$$RequestImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      ItemType itemType,
      bool priceHidden,
      bool isSold,
      String userId,
      PhoneNumber? phoneNumber,
      PlateNumber? plateNumber});

  @override
  $PhoneNumberCopyWith<$Res>? get phoneNumber;
  @override
  $PlateNumberCopyWith<$Res>? get plateNumber;
}

/// @nodoc
class __$$RequestImplCopyWithImpl<T, $Res>
    extends _$RequestCopyWithImpl<T, $Res, _$RequestImpl<T>>
    implements _$$RequestImplCopyWith<T, $Res> {
  __$$RequestImplCopyWithImpl(
      _$RequestImpl<T> _value, $Res Function(_$RequestImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? itemType = null,
    Object? priceHidden = null,
    Object? isSold = null,
    Object? userId = null,
    Object? phoneNumber = freezed,
    Object? plateNumber = freezed,
  }) {
    return _then(_$RequestImpl<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      priceHidden: null == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as PlateNumber?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestImpl<T> extends _Request<T> {
  _$RequestImpl(
      {required this.id,
      this.price = 0,
      required this.itemType,
      this.priceHidden = false,
      this.isSold = false,
      required this.userId,
      this.phoneNumber,
      this.plateNumber})
      : super._();

  factory _$RequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final double price;
  @override
  final ItemType itemType;
  @override
  @JsonKey()
  final bool priceHidden;
  @override
  @JsonKey()
  final bool isSold;
  @override
  final String userId;
  @override
  final PhoneNumber? phoneNumber;
  @override
  final PlateNumber? plateNumber;

  @override
  String toString() {
    return 'Request<$T>(id: $id, price: $price, itemType: $itemType, priceHidden: $priceHidden, isSold: $isSold, userId: $userId, phoneNumber: $phoneNumber, plateNumber: $plateNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.priceHidden, priceHidden) ||
                other.priceHidden == priceHidden) &&
            (identical(other.isSold, isSold) || other.isSold == isSold) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, price, itemType, priceHidden,
      isSold, userId, phoneNumber, plateNumber);

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestImplCopyWith<T, _$RequestImpl<T>> get copyWith =>
      __$$RequestImplCopyWithImpl<T, _$RequestImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestImplToJson<T>(
      this,
    );
  }
}

abstract class _Request<T> extends Request<T> {
  factory _Request(
      {required final String id,
      final double price,
      required final ItemType itemType,
      final bool priceHidden,
      final bool isSold,
      required final String userId,
      final PhoneNumber? phoneNumber,
      final PlateNumber? plateNumber}) = _$RequestImpl<T>;
  _Request._() : super._();

  factory _Request.fromJson(Map<String, dynamic> json) =
      _$RequestImpl<T>.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  ItemType get itemType;
  @override
  bool get priceHidden;
  @override
  bool get isSold;
  @override
  String get userId;
  @override
  PhoneNumber? get phoneNumber;
  @override
  PlateNumber? get plateNumber;

  /// Create a copy of Request
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestImplCopyWith<T, _$RequestImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
