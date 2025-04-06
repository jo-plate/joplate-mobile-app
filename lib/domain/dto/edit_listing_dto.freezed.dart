// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_listing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditListingDto _$EditListingDtoFromJson(Map<String, dynamic> json) {
  return _EditListingDto.fromJson(json);
}

/// @nodoc
mixin _$EditListingDto {
  String get listingId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  bool? get priceNegotiable => throw _privateConstructorUsedError;
  bool? get priceHidden => throw _privateConstructorUsedError;
  bool? get isSold => throw _privateConstructorUsedError;
  bool? get isFeatured => throw _privateConstructorUsedError;
  Map<String, dynamic> get itemData => throw _privateConstructorUsedError;

  /// Serializes this EditListingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EditListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditListingDtoCopyWith<EditListingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditListingDtoCopyWith<$Res> {
  factory $EditListingDtoCopyWith(
          EditListingDto value, $Res Function(EditListingDto) then) =
      _$EditListingDtoCopyWithImpl<$Res, EditListingDto>;
  @useResult
  $Res call(
      {String listingId,
      double price,
      double? discountPrice,
      ItemType itemType,
      bool? priceNegotiable,
      bool? priceHidden,
      bool? isSold,
      bool? isFeatured,
      Map<String, dynamic> itemData});
}

/// @nodoc
class _$EditListingDtoCopyWithImpl<$Res, $Val extends EditListingDto>
    implements $EditListingDtoCopyWith<$Res> {
  _$EditListingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? itemType = null,
    Object? priceNegotiable = freezed,
    Object? priceHidden = freezed,
    Object? isSold = freezed,
    Object? isFeatured = freezed,
    Object? itemData = null,
  }) {
    return _then(_value.copyWith(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      priceNegotiable: freezed == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      priceHidden: freezed == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSold: freezed == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemData: null == itemData
          ? _value.itemData
          : itemData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditListingDtoImplCopyWith<$Res>
    implements $EditListingDtoCopyWith<$Res> {
  factory _$$EditListingDtoImplCopyWith(_$EditListingDtoImpl value,
          $Res Function(_$EditListingDtoImpl) then) =
      __$$EditListingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String listingId,
      double price,
      double? discountPrice,
      ItemType itemType,
      bool? priceNegotiable,
      bool? priceHidden,
      bool? isSold,
      bool? isFeatured,
      Map<String, dynamic> itemData});
}

/// @nodoc
class __$$EditListingDtoImplCopyWithImpl<$Res>
    extends _$EditListingDtoCopyWithImpl<$Res, _$EditListingDtoImpl>
    implements _$$EditListingDtoImplCopyWith<$Res> {
  __$$EditListingDtoImplCopyWithImpl(
      _$EditListingDtoImpl _value, $Res Function(_$EditListingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? price = null,
    Object? discountPrice = freezed,
    Object? itemType = null,
    Object? priceNegotiable = freezed,
    Object? priceHidden = freezed,
    Object? isSold = freezed,
    Object? isFeatured = freezed,
    Object? itemData = null,
  }) {
    return _then(_$EditListingDtoImpl(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      priceNegotiable: freezed == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      priceHidden: freezed == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSold: freezed == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemData: null == itemData
          ? _value._itemData
          : itemData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditListingDtoImpl implements _EditListingDto {
  const _$EditListingDtoImpl(
      {required this.listingId,
      required this.price,
      this.discountPrice,
      required this.itemType,
      this.priceNegotiable,
      this.priceHidden,
      this.isSold,
      this.isFeatured,
      required final Map<String, dynamic> itemData})
      : _itemData = itemData;

  factory _$EditListingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditListingDtoImplFromJson(json);

  @override
  final String listingId;
  @override
  final double price;
  @override
  final double? discountPrice;
  @override
  final ItemType itemType;
  @override
  final bool? priceNegotiable;
  @override
  final bool? priceHidden;
  @override
  final bool? isSold;
  @override
  final bool? isFeatured;
  final Map<String, dynamic> _itemData;
  @override
  Map<String, dynamic> get itemData {
    if (_itemData is EqualUnmodifiableMapView) return _itemData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_itemData);
  }

  @override
  String toString() {
    return 'EditListingDto(listingId: $listingId, price: $price, discountPrice: $discountPrice, itemType: $itemType, priceNegotiable: $priceNegotiable, priceHidden: $priceHidden, isSold: $isSold, isFeatured: $isFeatured, itemData: $itemData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditListingDtoImpl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.priceNegotiable, priceNegotiable) ||
                other.priceNegotiable == priceNegotiable) &&
            (identical(other.priceHidden, priceHidden) ||
                other.priceHidden == priceHidden) &&
            (identical(other.isSold, isSold) || other.isSold == isSold) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            const DeepCollectionEquality().equals(other._itemData, _itemData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      listingId,
      price,
      discountPrice,
      itemType,
      priceNegotiable,
      priceHidden,
      isSold,
      isFeatured,
      const DeepCollectionEquality().hash(_itemData));

  /// Create a copy of EditListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditListingDtoImplCopyWith<_$EditListingDtoImpl> get copyWith =>
      __$$EditListingDtoImplCopyWithImpl<_$EditListingDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditListingDtoImplToJson(
      this,
    );
  }
}

abstract class _EditListingDto implements EditListingDto {
  const factory _EditListingDto(
      {required final String listingId,
      required final double price,
      final double? discountPrice,
      required final ItemType itemType,
      final bool? priceNegotiable,
      final bool? priceHidden,
      final bool? isSold,
      final bool? isFeatured,
      required final Map<String, dynamic> itemData}) = _$EditListingDtoImpl;

  factory _EditListingDto.fromJson(Map<String, dynamic> json) =
      _$EditListingDtoImpl.fromJson;

  @override
  String get listingId;
  @override
  double get price;
  @override
  double? get discountPrice;
  @override
  ItemType get itemType;
  @override
  bool? get priceNegotiable;
  @override
  bool? get priceHidden;
  @override
  bool? get isSold;
  @override
  bool? get isFeatured;
  @override
  Map<String, dynamic> get itemData;

  /// Create a copy of EditListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditListingDtoImplCopyWith<_$EditListingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
