// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_listing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateListingDto _$UpdateListingDtoFromJson(Map<String, dynamic> json) {
  return _UpdateListingDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateListingDto {
  String get listingId => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  ListingType get listingType => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  bool? get isFeatured => throw _privateConstructorUsedError;
  bool? get isDisabled => throw _privateConstructorUsedError;
  bool? get isSold => throw _privateConstructorUsedError;

  /// Serializes this UpdateListingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateListingDtoCopyWith<UpdateListingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateListingDtoCopyWith<$Res> {
  factory $UpdateListingDtoCopyWith(
          UpdateListingDto value, $Res Function(UpdateListingDto) then) =
      _$UpdateListingDtoCopyWithImpl<$Res, UpdateListingDto>;
  @useResult
  $Res call(
      {String listingId,
      ItemType itemType,
      ListingType listingType,
      double? price,
      double? discountPrice,
      bool? isFeatured,
      bool? isDisabled,
      bool? isSold});
}

/// @nodoc
class _$UpdateListingDtoCopyWithImpl<$Res, $Val extends UpdateListingDto>
    implements $UpdateListingDtoCopyWith<$Res> {
  _$UpdateListingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? itemType = null,
    Object? listingType = null,
    Object? price = freezed,
    Object? discountPrice = freezed,
    Object? isFeatured = freezed,
    Object? isDisabled = freezed,
    Object? isSold = freezed,
  }) {
    return _then(_value.copyWith(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDisabled: freezed == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSold: freezed == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateListingDtoImplCopyWith<$Res>
    implements $UpdateListingDtoCopyWith<$Res> {
  factory _$$UpdateListingDtoImplCopyWith(_$UpdateListingDtoImpl value,
          $Res Function(_$UpdateListingDtoImpl) then) =
      __$$UpdateListingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String listingId,
      ItemType itemType,
      ListingType listingType,
      double? price,
      double? discountPrice,
      bool? isFeatured,
      bool? isDisabled,
      bool? isSold});
}

/// @nodoc
class __$$UpdateListingDtoImplCopyWithImpl<$Res>
    extends _$UpdateListingDtoCopyWithImpl<$Res, _$UpdateListingDtoImpl>
    implements _$$UpdateListingDtoImplCopyWith<$Res> {
  __$$UpdateListingDtoImplCopyWithImpl(_$UpdateListingDtoImpl _value,
      $Res Function(_$UpdateListingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? itemType = null,
    Object? listingType = null,
    Object? price = freezed,
    Object? discountPrice = freezed,
    Object? isFeatured = freezed,
    Object? isDisabled = freezed,
    Object? isSold = freezed,
  }) {
    return _then(_$UpdateListingDtoImpl(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDisabled: freezed == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSold: freezed == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateListingDtoImpl extends _UpdateListingDto {
  const _$UpdateListingDtoImpl(
      {required this.listingId,
      required this.itemType,
      required this.listingType,
      this.price,
      this.discountPrice,
      this.isFeatured,
      this.isDisabled,
      this.isSold})
      : super._();

  factory _$UpdateListingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateListingDtoImplFromJson(json);

  @override
  final String listingId;
  @override
  final ItemType itemType;
  @override
  final ListingType listingType;
  @override
  final double? price;
  @override
  final double? discountPrice;
  @override
  final bool? isFeatured;
  @override
  final bool? isDisabled;
  @override
  final bool? isSold;

  @override
  String toString() {
    return 'UpdateListingDto(listingId: $listingId, itemType: $itemType, listingType: $listingType, price: $price, discountPrice: $discountPrice, isFeatured: $isFeatured, isDisabled: $isDisabled, isSold: $isSold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateListingDtoImpl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.isDisabled, isDisabled) ||
                other.isDisabled == isDisabled) &&
            (identical(other.isSold, isSold) || other.isSold == isSold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, listingId, itemType, listingType,
      price, discountPrice, isFeatured, isDisabled, isSold);

  /// Create a copy of UpdateListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateListingDtoImplCopyWith<_$UpdateListingDtoImpl> get copyWith =>
      __$$UpdateListingDtoImplCopyWithImpl<_$UpdateListingDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateListingDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateListingDto extends UpdateListingDto {
  const factory _UpdateListingDto(
      {required final String listingId,
      required final ItemType itemType,
      required final ListingType listingType,
      final double? price,
      final double? discountPrice,
      final bool? isFeatured,
      final bool? isDisabled,
      final bool? isSold}) = _$UpdateListingDtoImpl;
  const _UpdateListingDto._() : super._();

  factory _UpdateListingDto.fromJson(Map<String, dynamic> json) =
      _$UpdateListingDtoImpl.fromJson;

  @override
  String get listingId;
  @override
  ItemType get itemType;
  @override
  ListingType get listingType;
  @override
  double? get price;
  @override
  double? get discountPrice;
  @override
  bool? get isFeatured;
  @override
  bool? get isDisabled;
  @override
  bool? get isSold;

  /// Create a copy of UpdateListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateListingDtoImplCopyWith<_$UpdateListingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
