// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhoneListing _$PhoneListingFromJson(Map<String, dynamic> json) {
  return _PhoneListing.fromJson(json);
}

/// @nodoc
mixin _$PhoneListing {
  String get id => throw _privateConstructorUsedError;
  PhoneNumber get item => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;
  bool get priceNegotiable => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  bool get isDisabled => throw _privateConstructorUsedError;
  bool get isSold => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this PhoneListing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhoneListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneListingCopyWith<PhoneListing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneListingCopyWith<$Res> {
  factory $PhoneListingCopyWith(
          PhoneListing value, $Res Function(PhoneListing) then) =
      _$PhoneListingCopyWithImpl<$Res, PhoneListing>;
  @useResult
  $Res call(
      {String id,
      PhoneNumber item,
      double price,
      double discountPrice,
      bool priceNegotiable,
      bool isFeatured,
      bool isDisabled,
      bool isSold,
      DateTime? createdAt,
      DateTime? expiresAt,
      String userId});

  $PhoneNumberCopyWith<$Res> get item;
}

/// @nodoc
class _$PhoneListingCopyWithImpl<$Res, $Val extends PhoneListing>
    implements $PhoneListingCopyWith<$Res> {
  _$PhoneListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? priceNegotiable = null,
    Object? isFeatured = null,
    Object? isDisabled = null,
    Object? isSold = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceNegotiable: null == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisabled: null == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of PhoneListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhoneNumberCopyWith<$Res> get item {
    return $PhoneNumberCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhoneListingImplCopyWith<$Res>
    implements $PhoneListingCopyWith<$Res> {
  factory _$$PhoneListingImplCopyWith(
          _$PhoneListingImpl value, $Res Function(_$PhoneListingImpl) then) =
      __$$PhoneListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PhoneNumber item,
      double price,
      double discountPrice,
      bool priceNegotiable,
      bool isFeatured,
      bool isDisabled,
      bool isSold,
      DateTime? createdAt,
      DateTime? expiresAt,
      String userId});

  @override
  $PhoneNumberCopyWith<$Res> get item;
}

/// @nodoc
class __$$PhoneListingImplCopyWithImpl<$Res>
    extends _$PhoneListingCopyWithImpl<$Res, _$PhoneListingImpl>
    implements _$$PhoneListingImplCopyWith<$Res> {
  __$$PhoneListingImplCopyWithImpl(
      _$PhoneListingImpl _value, $Res Function(_$PhoneListingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? priceNegotiable = null,
    Object? isFeatured = null,
    Object? isDisabled = null,
    Object? isSold = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? userId = null,
  }) {
    return _then(_$PhoneListingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceNegotiable: null == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isDisabled: null == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneListingImpl extends _PhoneListing {
  const _$PhoneListingImpl(
      {required this.id,
      required this.item,
      this.price = 0.0,
      this.discountPrice = 0.0,
      this.priceNegotiable = false,
      this.isFeatured = false,
      this.isDisabled = true,
      this.isSold = false,
      this.createdAt,
      this.expiresAt,
      required this.userId})
      : super._();

  factory _$PhoneListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneListingImplFromJson(json);

  @override
  final String id;
  @override
  final PhoneNumber item;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final double discountPrice;
  @override
  @JsonKey()
  final bool priceNegotiable;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  @JsonKey()
  final bool isDisabled;
  @override
  @JsonKey()
  final bool isSold;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? expiresAt;
  @override
  final String userId;

  @override
  String toString() {
    return 'PhoneListing(id: $id, item: $item, price: $price, discountPrice: $discountPrice, priceNegotiable: $priceNegotiable, isFeatured: $isFeatured, isDisabled: $isDisabled, isSold: $isSold, createdAt: $createdAt, expiresAt: $expiresAt, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneListingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.priceNegotiable, priceNegotiable) ||
                other.priceNegotiable == priceNegotiable) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isDisabled, isDisabled) ||
                other.isDisabled == isDisabled) &&
            (identical(other.isSold, isSold) || other.isSold == isSold) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      item,
      price,
      discountPrice,
      priceNegotiable,
      isFeatured,
      isDisabled,
      isSold,
      createdAt,
      expiresAt,
      userId);

  /// Create a copy of PhoneListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneListingImplCopyWith<_$PhoneListingImpl> get copyWith =>
      __$$PhoneListingImplCopyWithImpl<_$PhoneListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneListingImplToJson(
      this,
    );
  }
}

abstract class _PhoneListing extends PhoneListing {
  const factory _PhoneListing(
      {required final String id,
      required final PhoneNumber item,
      final double price,
      final double discountPrice,
      final bool priceNegotiable,
      final bool isFeatured,
      final bool isDisabled,
      final bool isSold,
      final DateTime? createdAt,
      final DateTime? expiresAt,
      required final String userId}) = _$PhoneListingImpl;
  const _PhoneListing._() : super._();

  factory _PhoneListing.fromJson(Map<String, dynamic> json) =
      _$PhoneListingImpl.fromJson;

  @override
  String get id;
  @override
  PhoneNumber get item;
  @override
  double get price;
  @override
  double get discountPrice;
  @override
  bool get priceNegotiable;
  @override
  bool get isFeatured;
  @override
  bool get isDisabled;
  @override
  bool get isSold;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get expiresAt;
  @override
  String get userId;

  /// Create a copy of PhoneListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneListingImplCopyWith<_$PhoneListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
