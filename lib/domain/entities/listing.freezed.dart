// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Listing<T> _$ListingFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Listing<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Listing<T> {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  ListingType get listingType => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  bool get priceNegotiable => throw _privateConstructorUsedError;
  bool get priceHidden => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  UserProfile get seller => throw _privateConstructorUsedError;
  @PhoneOrPlateConverter()
  T get itemData => throw _privateConstructorUsedError;

  /// Serializes this Listing to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListingCopyWith<T, Listing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingCopyWith<T, $Res> {
  factory $ListingCopyWith(Listing<T> value, $Res Function(Listing<T>) then) =
      _$ListingCopyWithImpl<T, $Res, Listing<T>>;
  @useResult
  $Res call(
      {String id,
      double price,
      double discountPrice,
      String userId,
      ListingType listingType,
      ItemType itemType,
      bool priceNegotiable,
      bool priceHidden,
      bool isFeatured,
      UserProfile seller,
      @PhoneOrPlateConverter() T itemData});

  $UserProfileCopyWith<$Res> get seller;
}

/// @nodoc
class _$ListingCopyWithImpl<T, $Res, $Val extends Listing<T>>
    implements $ListingCopyWith<T, $Res> {
  _$ListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? userId = null,
    Object? listingType = null,
    Object? itemType = null,
    Object? priceNegotiable = null,
    Object? priceHidden = null,
    Object? isFeatured = null,
    Object? seller = null,
    Object? itemData = freezed,
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
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
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
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      itemData: freezed == itemData
          ? _value.itemData
          : itemData // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get seller {
    return $UserProfileCopyWith<$Res>(_value.seller, (value) {
      return _then(_value.copyWith(seller: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListingImplCopyWith<T, $Res>
    implements $ListingCopyWith<T, $Res> {
  factory _$$ListingImplCopyWith(
          _$ListingImpl<T> value, $Res Function(_$ListingImpl<T>) then) =
      __$$ListingImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      double discountPrice,
      String userId,
      ListingType listingType,
      ItemType itemType,
      bool priceNegotiable,
      bool priceHidden,
      bool isFeatured,
      UserProfile seller,
      @PhoneOrPlateConverter() T itemData});

  @override
  $UserProfileCopyWith<$Res> get seller;
}

/// @nodoc
class __$$ListingImplCopyWithImpl<T, $Res>
    extends _$ListingCopyWithImpl<T, $Res, _$ListingImpl<T>>
    implements _$$ListingImplCopyWith<T, $Res> {
  __$$ListingImplCopyWithImpl(
      _$ListingImpl<T> _value, $Res Function(_$ListingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? userId = null,
    Object? listingType = null,
    Object? itemType = null,
    Object? priceNegotiable = null,
    Object? priceHidden = null,
    Object? isFeatured = null,
    Object? seller = null,
    Object? itemData = freezed,
  }) {
    return _then(_$ListingImpl<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
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
      seller: null == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      itemData: freezed == itemData
          ? _value.itemData
          : itemData // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ListingImpl<T> extends _Listing<T> {
  const _$ListingImpl(
      {required this.id,
      required this.price,
      required this.discountPrice,
      required this.userId,
      required this.listingType,
      required this.itemType,
      required this.priceNegotiable,
      required this.priceHidden,
      required this.isFeatured,
      required this.seller,
      @PhoneOrPlateConverter() required this.itemData})
      : super._();

  factory _$ListingImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ListingImplFromJson(json, fromJsonT);

  @override
  final String id;
  @override
  final double price;
  @override
  final double discountPrice;
  @override
  final String userId;
  @override
  final ListingType listingType;
  @override
  final ItemType itemType;
  @override
  final bool priceNegotiable;
  @override
  final bool priceHidden;
  @override
  final bool isFeatured;
  @override
  final UserProfile seller;
  @override
  @PhoneOrPlateConverter()
  final T itemData;

  @override
  String toString() {
    return 'Listing<$T>(id: $id, price: $price, discountPrice: $discountPrice, userId: $userId, listingType: $listingType, itemType: $itemType, priceNegotiable: $priceNegotiable, priceHidden: $priceHidden, isFeatured: $isFeatured, seller: $seller, itemData: $itemData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.priceNegotiable, priceNegotiable) ||
                other.priceNegotiable == priceNegotiable) &&
            (identical(other.priceHidden, priceHidden) ||
                other.priceHidden == priceHidden) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            const DeepCollectionEquality().equals(other.itemData, itemData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      discountPrice,
      userId,
      listingType,
      itemType,
      priceNegotiable,
      priceHidden,
      isFeatured,
      seller,
      const DeepCollectionEquality().hash(itemData));

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingImplCopyWith<T, _$ListingImpl<T>> get copyWith =>
      __$$ListingImplCopyWithImpl<T, _$ListingImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ListingImplToJson<T>(this, toJsonT);
  }
}

abstract class _Listing<T> extends Listing<T> {
  const factory _Listing(
      {required final String id,
      required final double price,
      required final double discountPrice,
      required final String userId,
      required final ListingType listingType,
      required final ItemType itemType,
      required final bool priceNegotiable,
      required final bool priceHidden,
      required final bool isFeatured,
      required final UserProfile seller,
      @PhoneOrPlateConverter() required final T itemData}) = _$ListingImpl<T>;
  const _Listing._() : super._();

  factory _Listing.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ListingImpl<T>.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  double get discountPrice;
  @override
  String get userId;
  @override
  ListingType get listingType;
  @override
  ItemType get itemType;
  @override
  bool get priceNegotiable;
  @override
  bool get priceHidden;
  @override
  bool get isFeatured;
  @override
  UserProfile get seller;
  @override
  @PhoneOrPlateConverter()
  T get itemData;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingImplCopyWith<T, _$ListingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
