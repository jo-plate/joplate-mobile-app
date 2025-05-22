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
  int get price => throw _privateConstructorUsedError;
  int get discountPrice => throw _privateConstructorUsedError;
  ListingType get listingType => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  Map<String, dynamic> get item => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

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
      {int price,
      int discountPrice,
      ListingType listingType,
      ItemType itemType,
      bool isFeatured,
      Map<String, dynamic> item,
      String? description});
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
    Object? isFeatured = null,
    Object? item = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {int price,
      int discountPrice,
      ListingType listingType,
      ItemType itemType,
      bool isFeatured,
      Map<String, dynamic> item,
      String? description});
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
    Object? isFeatured = null,
    Object? item = null,
    Object? description = freezed,
  }) {
    return _then(_$AddListingDtoImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      isFeatured: null == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      required this.isFeatured,
      required final Map<String, dynamic> item,
      this.description})
      : _item = item;

  factory _$AddListingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddListingDtoImplFromJson(json);

  @override
  final int price;
  @override
  final int discountPrice;
  @override
  final ListingType listingType;
  @override
  final ItemType itemType;
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
  final String? description;

  @override
  String toString() {
    return 'AddListingDto(price: $price, discountPrice: $discountPrice, listingType: $listingType, itemType: $itemType, isFeatured: $isFeatured, item: $item, description: $description)';
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
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      price,
      discountPrice,
      listingType,
      itemType,
      isFeatured,
      const DeepCollectionEquality().hash(_item),
      description);

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
      {required final int price,
      required final int discountPrice,
      required final ListingType listingType,
      required final ItemType itemType,
      required final bool isFeatured,
      required final Map<String, dynamic> item,
      final String? description}) = _$AddListingDtoImpl;

  factory _AddListingDto.fromJson(Map<String, dynamic> json) =
      _$AddListingDtoImpl.fromJson;

  @override
  int get price;
  @override
  int get discountPrice;
  @override
  ListingType get listingType;
  @override
  ItemType get itemType;
  @override
  bool get isFeatured;
  @override
  Map<String, dynamic> get item;
  @override
  String? get description;

  /// Create a copy of AddListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddListingDtoImplCopyWith<_$AddListingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
