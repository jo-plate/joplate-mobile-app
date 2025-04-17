// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plate_listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlateListing _$PlateListingFromJson(Map<String, dynamic> json) {
  return _PlateListing.fromJson(json);
}

/// @nodoc
mixin _$PlateListing {
  String get id => throw _privateConstructorUsedError;
  PlateNumber get item => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  bool get isDisabled => throw _privateConstructorUsedError;
  bool get isSold => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  /// Serializes this PlateListing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlateListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlateListingCopyWith<PlateListing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlateListingCopyWith<$Res> {
  factory $PlateListingCopyWith(
          PlateListing value, $Res Function(PlateListing) then) =
      _$PlateListingCopyWithImpl<$Res, PlateListing>;
  @useResult
  $Res call(
      {String id,
      PlateNumber item,
      double price,
      double discountPrice,
      bool isFeatured,
      bool isDisabled,
      bool isSold,
      DateTime? createdAt,
      DateTime? expiresAt,
      String userId});

  $PlateNumberCopyWith<$Res> get item;
}

/// @nodoc
class _$PlateListingCopyWithImpl<$Res, $Val extends PlateListing>
    implements $PlateListingCopyWith<$Res> {
  _$PlateListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlateListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? price = null,
    Object? discountPrice = null,
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
              as PlateNumber,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
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

  /// Create a copy of PlateListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlateNumberCopyWith<$Res> get item {
    return $PlateNumberCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlateListingImplCopyWith<$Res>
    implements $PlateListingCopyWith<$Res> {
  factory _$$PlateListingImplCopyWith(
          _$PlateListingImpl value, $Res Function(_$PlateListingImpl) then) =
      __$$PlateListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PlateNumber item,
      double price,
      double discountPrice,
      bool isFeatured,
      bool isDisabled,
      bool isSold,
      DateTime? createdAt,
      DateTime? expiresAt,
      String userId});

  @override
  $PlateNumberCopyWith<$Res> get item;
}

/// @nodoc
class __$$PlateListingImplCopyWithImpl<$Res>
    extends _$PlateListingCopyWithImpl<$Res, _$PlateListingImpl>
    implements _$$PlateListingImplCopyWith<$Res> {
  __$$PlateListingImplCopyWithImpl(
      _$PlateListingImpl _value, $Res Function(_$PlateListingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlateListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? item = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? isFeatured = null,
    Object? isDisabled = null,
    Object? isSold = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? userId = null,
  }) {
    return _then(_$PlateListingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PlateNumber,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$PlateListingImpl extends _PlateListing {
  const _$PlateListingImpl(
      {required this.id,
      required this.item,
      this.price = 0.0,
      this.discountPrice = 0.0,
      this.isFeatured = false,
      this.isDisabled = true,
      this.isSold = false,
      this.createdAt,
      this.expiresAt,
      required this.userId})
      : super._();

  factory _$PlateListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlateListingImplFromJson(json);

  @override
  final String id;
  @override
  final PlateNumber item;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final double discountPrice;
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
    return 'PlateListing(id: $id, item: $item, price: $price, discountPrice: $discountPrice, isFeatured: $isFeatured, isDisabled: $isDisabled, isSold: $isSold, createdAt: $createdAt, expiresAt: $expiresAt, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlateListingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
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
  int get hashCode => Object.hash(runtimeType, id, item, price, discountPrice,
      isFeatured, isDisabled, isSold, createdAt, expiresAt, userId);

  /// Create a copy of PlateListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlateListingImplCopyWith<_$PlateListingImpl> get copyWith =>
      __$$PlateListingImplCopyWithImpl<_$PlateListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlateListingImplToJson(
      this,
    );
  }
}

abstract class _PlateListing extends PlateListing {
  const factory _PlateListing(
      {required final String id,
      required final PlateNumber item,
      final double price,
      final double discountPrice,
      final bool isFeatured,
      final bool isDisabled,
      final bool isSold,
      final DateTime? createdAt,
      final DateTime? expiresAt,
      required final String userId}) = _$PlateListingImpl;
  const _PlateListing._() : super._();

  factory _PlateListing.fromJson(Map<String, dynamic> json) =
      _$PlateListingImpl.fromJson;

  @override
  String get id;
  @override
  PlateNumber get item;
  @override
  double get price;
  @override
  double get discountPrice;
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

  /// Create a copy of PlateListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlateListingImplCopyWith<_$PlateListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
