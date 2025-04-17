// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_listing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddListingDto _$AddListingDtoFromJson(Map<String, dynamic> json) {
  return _AddListingDto.fromJson(json);
}

/// @nodoc
mixin _$AddListingDto {
  double get price => throw _privateConstructorUsedError;
  double get discountPrice => throw _privateConstructorUsedError;
  ListingType get listingType => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  bool get priceNegotiable => throw _privateConstructorUsedError;
  bool get priceHidden => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  Map<String, dynamic> get item => throw _privateConstructorUsedError;

  /// Serializes this AddListingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddListingDtoCopyWith<AddListingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddListingDtoCopyWith<$Res> {
  factory $AddListingDtoCopyWith(
          AddListingDto value, $Res Function(AddListingDto) then) =
      _$AddListingDtoCopyWithImpl<$Res, AddListingDto>;
  @useResult
  $Res call(
      {double price,
      double discountPrice,
      ListingType listingType,
      ItemType itemType,
      bool priceNegotiable,
      bool priceHidden,
      bool isFeatured,
      Map<String, dynamic> item});
}

/// @nodoc
class _$AddListingDtoCopyWithImpl<$Res, $Val extends AddListingDto>
    implements $AddListingDtoCopyWith<$Res> {
  _$AddListingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? discountPrice = null,
    Object? listingType = null,
    Object? itemType = null,
    Object? priceNegotiable = null,
    Object? priceHidden = null,
    Object? isFeatured = null,
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
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
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddListingDtoImplCopyWith<$Res>
    implements $AddListingDtoCopyWith<$Res> {
  factory _$$AddListingDtoImplCopyWith(
          _$AddListingDtoImpl value, $Res Function(_$AddListingDtoImpl) then) =
      __$$AddListingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double price,
      double discountPrice,
      ListingType listingType,
      ItemType itemType,
      bool priceNegotiable,
      bool priceHidden,
      bool isFeatured,
      Map<String, dynamic> item});
}

/// @nodoc
class __$$AddListingDtoImplCopyWithImpl<$Res>
    extends _$AddListingDtoCopyWithImpl<$Res, _$AddListingDtoImpl>
    implements _$$AddListingDtoImplCopyWith<$Res> {
  __$$AddListingDtoImplCopyWithImpl(
      _$AddListingDtoImpl _value, $Res Function(_$AddListingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? discountPrice = null,
    Object? listingType = null,
    Object? itemType = null,
    Object? priceNegotiable = null,
    Object? priceHidden = null,
    Object? isFeatured = null,
    Object? item = null,
  }) {
    return _then(_$AddListingDtoImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
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
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddListingDtoImpl implements _AddListingDto {
  const _$AddListingDtoImpl(
      {required this.price,
      required this.discountPrice,
      required this.listingType,
      required this.itemType,
      required this.priceNegotiable,
      required this.priceHidden,
      required this.isFeatured,
      required final Map<String, dynamic> item})
      : _item = item;

  factory _$AddListingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddListingDtoImplFromJson(json);

  @override
  final double price;
  @override
  final double discountPrice;
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
  final Map<String, dynamic> _item;
  @override
  Map<String, dynamic> get item {
    if (_item is EqualUnmodifiableMapView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_item);
  }

  @override
  String toString() {
    return 'AddListingDto(price: $price, discountPrice: $discountPrice, listingType: $listingType, itemType: $itemType, priceNegotiable: $priceNegotiable, priceHidden: $priceHidden, isFeatured: $isFeatured, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddListingDtoImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
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
            const DeepCollectionEquality().equals(other._item, _item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      price,
      discountPrice,
      listingType,
      itemType,
      priceNegotiable,
      priceHidden,
      isFeatured,
      const DeepCollectionEquality().hash(_item));

  /// Create a copy of AddListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddListingDtoImplCopyWith<_$AddListingDtoImpl> get copyWith =>
      __$$AddListingDtoImplCopyWithImpl<_$AddListingDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddListingDtoImplToJson(
      this,
    );
  }
}

abstract class _AddListingDto implements AddListingDto {
  const factory _AddListingDto(
      {required final double price,
      required final double discountPrice,
      required final ListingType listingType,
      required final ItemType itemType,
      required final bool priceNegotiable,
      required final bool priceHidden,
      required final bool isFeatured,
      required final Map<String, dynamic> item}) = _$AddListingDtoImpl;

  factory _AddListingDto.fromJson(Map<String, dynamic> json) =
      _$AddListingDtoImpl.fromJson;

  @override
  double get price;
  @override
  double get discountPrice;
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
  Map<String, dynamic> get item;

  /// Create a copy of AddListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddListingDtoImplCopyWith<_$AddListingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
