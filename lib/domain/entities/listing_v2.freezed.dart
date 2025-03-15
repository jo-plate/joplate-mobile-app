// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_v2.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListingV2 _$ListingV2FromJson(Map<String, dynamic> json) {
  return _ListingV2.fromJson(json);
}

/// @nodoc
mixin _$ListingV2 {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  bool get priceNegotiable => throw _privateConstructorUsedError;
  bool get priceHidden => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isSold => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;
  UserProfile? get postedBy => throw _privateConstructorUsedError;

  /// Serializes this ListingV2 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListingV2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListingV2CopyWith<ListingV2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingV2CopyWith<$Res> {
  factory $ListingV2CopyWith(ListingV2 value, $Res Function(ListingV2) then) =
      _$ListingV2CopyWithImpl<$Res, ListingV2>;
  @useResult
  $Res call(
      {String id,
      double price,
      double? discountPrice,
      bool priceNegotiable,
      bool priceHidden,
      bool isFeatured,
      bool isActive,
      bool isSold,
      String createdAt,
      String? expiresAt,
      UserProfile? postedBy});

  $UserProfileCopyWith<$Res>? get postedBy;
}

/// @nodoc
class _$ListingV2CopyWithImpl<$Res, $Val extends ListingV2>
    implements $ListingV2CopyWith<$Res> {
  _$ListingV2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListingV2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? priceNegotiable = null,
    Object? priceHidden = null,
    Object? isFeatured = null,
    Object? isActive = null,
    Object? isSold = null,
    Object? createdAt = null,
    Object? expiresAt = freezed,
    Object? postedBy = freezed,
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
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      priceNegotiable: null == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool,
      priceHidden: null == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      postedBy: freezed == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ) as $Val);
  }

  /// Create a copy of ListingV2
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get postedBy {
    if (_value.postedBy == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.postedBy!, (value) {
      return _then(_value.copyWith(postedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListingV2ImplCopyWith<$Res>
    implements $ListingV2CopyWith<$Res> {
  factory _$$ListingV2ImplCopyWith(
          _$ListingV2Impl value, $Res Function(_$ListingV2Impl) then) =
      __$$ListingV2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      double? discountPrice,
      bool priceNegotiable,
      bool priceHidden,
      bool isFeatured,
      bool isActive,
      bool isSold,
      String createdAt,
      String? expiresAt,
      UserProfile? postedBy});

  @override
  $UserProfileCopyWith<$Res>? get postedBy;
}

/// @nodoc
class __$$ListingV2ImplCopyWithImpl<$Res>
    extends _$ListingV2CopyWithImpl<$Res, _$ListingV2Impl>
    implements _$$ListingV2ImplCopyWith<$Res> {
  __$$ListingV2ImplCopyWithImpl(
      _$ListingV2Impl _value, $Res Function(_$ListingV2Impl) _then)
      : super(_value, _then);

  /// Create a copy of ListingV2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? priceNegotiable = null,
    Object? priceHidden = null,
    Object? isFeatured = null,
    Object? isActive = null,
    Object? isSold = null,
    Object? createdAt = null,
    Object? expiresAt = freezed,
    Object? postedBy = freezed,
  }) {
    return _then(_$ListingV2Impl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      priceNegotiable: null == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool,
      priceHidden: null == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      postedBy: freezed == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingV2Impl extends _ListingV2 {
  const _$ListingV2Impl(
      {required this.id,
      required this.price,
      this.discountPrice,
      this.priceNegotiable = false,
      this.priceHidden = false,
      this.isFeatured = false,
      this.isActive = true,
      this.isSold = false,
      required this.createdAt,
      this.expiresAt,
      this.postedBy})
      : super._();

  factory _$ListingV2Impl.fromJson(Map<String, dynamic> json) =>
      _$$ListingV2ImplFromJson(json);

  @override
  final String id;
  @override
  final double price;
  @override
  final double? discountPrice;
  @override
  @JsonKey()
  final bool priceNegotiable;
  @override
  @JsonKey()
  final bool priceHidden;
  @override
  @JsonKey()
  final bool isFeatured;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isSold;
  @override
  final String createdAt;
  @override
  final String? expiresAt;
  @override
  final UserProfile? postedBy;

  @override
  String toString() {
    return 'ListingV2(id: $id, price: $price, discountPrice: $discountPrice, priceNegotiable: $priceNegotiable, priceHidden: $priceHidden, isFeatured: $isFeatured, isActive: $isActive, isSold: $isSold, createdAt: $createdAt, expiresAt: $expiresAt, postedBy: $postedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingV2Impl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.priceNegotiable, priceNegotiable) ||
                other.priceNegotiable == priceNegotiable) &&
            (identical(other.priceHidden, priceHidden) ||
                other.priceHidden == priceHidden) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSold, isSold) || other.isSold == isSold) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.postedBy, postedBy) ||
                other.postedBy == postedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      discountPrice,
      priceNegotiable,
      priceHidden,
      isFeatured,
      isActive,
      isSold,
      createdAt,
      expiresAt,
      postedBy);

  /// Create a copy of ListingV2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingV2ImplCopyWith<_$ListingV2Impl> get copyWith =>
      __$$ListingV2ImplCopyWithImpl<_$ListingV2Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingV2ImplToJson(
      this,
    );
  }
}

abstract class _ListingV2 extends ListingV2 {
  const factory _ListingV2(
      {required final String id,
      required final double price,
      final double? discountPrice,
      final bool priceNegotiable,
      final bool priceHidden,
      final bool isFeatured,
      final bool isActive,
      final bool isSold,
      required final String createdAt,
      final String? expiresAt,
      final UserProfile? postedBy}) = _$ListingV2Impl;
  const _ListingV2._() : super._();

  factory _ListingV2.fromJson(Map<String, dynamic> json) =
      _$ListingV2Impl.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  double? get discountPrice;
  @override
  bool get priceNegotiable;
  @override
  bool get priceHidden;
  @override
  bool get isFeatured;
  @override
  bool get isActive;
  @override
  bool get isSold;
  @override
  String get createdAt;
  @override
  String? get expiresAt;
  @override
  UserProfile? get postedBy;

  /// Create a copy of ListingV2
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingV2ImplCopyWith<_$ListingV2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
