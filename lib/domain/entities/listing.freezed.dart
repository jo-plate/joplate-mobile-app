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
  @ItemTypeConverter()
  T get item => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  ListingType get listingType => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get priceNegotiable => throw _privateConstructorUsedError;
  dynamic get priceHidden => throw _privateConstructorUsedError;

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
      {@ItemTypeConverter() T item,
      ItemType itemType,
      ListingType listingType,
      double price,
      double? discountPrice,
      String userId,
      String description,
      bool priceNegotiable,
      dynamic priceHidden});
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
    Object? item = freezed,
    Object? itemType = null,
    Object? listingType = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? userId = null,
    Object? description = null,
    Object? priceNegotiable = null,
    Object? priceHidden = freezed,
  }) {
    return _then(_value.copyWith(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priceNegotiable: null == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool,
      priceHidden: freezed == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
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
      {@ItemTypeConverter() T item,
      ItemType itemType,
      ListingType listingType,
      double price,
      double? discountPrice,
      String userId,
      String description,
      bool priceNegotiable,
      dynamic priceHidden});
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
    Object? item = freezed,
    Object? itemType = null,
    Object? listingType = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? userId = null,
    Object? description = null,
    Object? priceNegotiable = null,
    Object? priceHidden = freezed,
  }) {
    return _then(_$ListingImpl<T>(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priceNegotiable: null == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool,
      priceHidden: freezed == priceHidden ? _value.priceHidden! : priceHidden,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ListingImpl<T> extends _Listing<T> {
  const _$ListingImpl(
      {@ItemTypeConverter() required this.item,
      required this.itemType,
      required this.listingType,
      required this.price,
      this.discountPrice,
      this.userId = '',
      this.description = '',
      this.priceNegotiable = false,
      this.priceHidden = false})
      : super._();

  factory _$ListingImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ListingImplFromJson(json, fromJsonT);

  @override
  @ItemTypeConverter()
  final T item;
  @override
  final ItemType itemType;
  @override
  final ListingType listingType;
  @override
  final double price;
  @override
  final double? discountPrice;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool priceNegotiable;
  @override
  @JsonKey()
  final dynamic priceHidden;

  @override
  String toString() {
    return 'Listing<$T>(item: $item, itemType: $itemType, listingType: $listingType, price: $price, discountPrice: $discountPrice, userId: $userId, description: $description, priceNegotiable: $priceNegotiable, priceHidden: $priceHidden)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingImpl<T> &&
            const DeepCollectionEquality().equals(other.item, item) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priceNegotiable, priceNegotiable) ||
                other.priceNegotiable == priceNegotiable) &&
            const DeepCollectionEquality()
                .equals(other.priceHidden, priceHidden));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      itemType,
      listingType,
      price,
      discountPrice,
      userId,
      description,
      priceNegotiable,
      const DeepCollectionEquality().hash(priceHidden));

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
      {@ItemTypeConverter() required final T item,
      required final ItemType itemType,
      required final ListingType listingType,
      required final double price,
      final double? discountPrice,
      final String userId,
      final String description,
      final bool priceNegotiable,
      final dynamic priceHidden}) = _$ListingImpl<T>;
  const _Listing._() : super._();

  factory _Listing.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ListingImpl<T>.fromJson;

  @override
  @ItemTypeConverter()
  T get item;
  @override
  ItemType get itemType;
  @override
  ListingType get listingType;
  @override
  double get price;
  @override
  double? get discountPrice;
  @override
  String get userId;
  @override
  String get description;
  @override
  bool get priceNegotiable;
  @override
  dynamic get priceHidden;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingImplCopyWith<T, _$ListingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
