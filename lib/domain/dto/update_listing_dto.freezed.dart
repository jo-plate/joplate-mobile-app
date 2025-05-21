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

UpdateListingDtoV2 _$UpdateListingDtoV2FromJson(Map<String, dynamic> json) {
  return _UpdateListingDtoV2.fromJson(json);
}

/// @nodoc
mixin _$UpdateListingDtoV2 {
  String get listingId => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  int? get discountPrice => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this UpdateListingDtoV2 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateListingDtoV2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateListingDtoV2CopyWith<UpdateListingDtoV2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateListingDtoV2CopyWith<$Res> {
  factory $UpdateListingDtoV2CopyWith(
          UpdateListingDtoV2 value, $Res Function(UpdateListingDtoV2) then) =
      _$UpdateListingDtoV2CopyWithImpl<$Res, UpdateListingDtoV2>;
  @useResult
  $Res call(
      {String listingId,
      ItemType itemType,
      int? price,
      int? discountPrice,
      String? description});
}

/// @nodoc
class _$UpdateListingDtoV2CopyWithImpl<$Res, $Val extends UpdateListingDtoV2>
    implements $UpdateListingDtoV2CopyWith<$Res> {
  _$UpdateListingDtoV2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateListingDtoV2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? itemType = null,
    Object? price = freezed,
    Object? discountPrice = freezed,
    Object? description = freezed,
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
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateListingDtoV2ImplCopyWith<$Res>
    implements $UpdateListingDtoV2CopyWith<$Res> {
  factory _$$UpdateListingDtoV2ImplCopyWith(_$UpdateListingDtoV2Impl value,
          $Res Function(_$UpdateListingDtoV2Impl) then) =
      __$$UpdateListingDtoV2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String listingId,
      ItemType itemType,
      int? price,
      int? discountPrice,
      String? description});
}

/// @nodoc
class __$$UpdateListingDtoV2ImplCopyWithImpl<$Res>
    extends _$UpdateListingDtoV2CopyWithImpl<$Res, _$UpdateListingDtoV2Impl>
    implements _$$UpdateListingDtoV2ImplCopyWith<$Res> {
  __$$UpdateListingDtoV2ImplCopyWithImpl(_$UpdateListingDtoV2Impl _value,
      $Res Function(_$UpdateListingDtoV2Impl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateListingDtoV2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? itemType = null,
    Object? price = freezed,
    Object? discountPrice = freezed,
    Object? description = freezed,
  }) {
    return _then(_$UpdateListingDtoV2Impl(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateListingDtoV2Impl extends _UpdateListingDtoV2 {
  const _$UpdateListingDtoV2Impl(
      {required this.listingId,
      required this.itemType,
      this.price,
      this.discountPrice,
      this.description})
      : super._();

  factory _$UpdateListingDtoV2Impl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateListingDtoV2ImplFromJson(json);

  @override
  final String listingId;
  @override
  final ItemType itemType;
  @override
  final int? price;
  @override
  final int? discountPrice;
  @override
  final String? description;

  @override
  String toString() {
    return 'UpdateListingDtoV2(listingId: $listingId, itemType: $itemType, price: $price, discountPrice: $discountPrice, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateListingDtoV2Impl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, listingId, itemType, price, discountPrice, description);

  /// Create a copy of UpdateListingDtoV2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateListingDtoV2ImplCopyWith<_$UpdateListingDtoV2Impl> get copyWith =>
      __$$UpdateListingDtoV2ImplCopyWithImpl<_$UpdateListingDtoV2Impl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateListingDtoV2ImplToJson(
      this,
    );
  }
}

abstract class _UpdateListingDtoV2 extends UpdateListingDtoV2 {
  const factory _UpdateListingDtoV2(
      {required final String listingId,
      required final ItemType itemType,
      final int? price,
      final int? discountPrice,
      final String? description}) = _$UpdateListingDtoV2Impl;
  const _UpdateListingDtoV2._() : super._();

  factory _UpdateListingDtoV2.fromJson(Map<String, dynamic> json) =
      _$UpdateListingDtoV2Impl.fromJson;

  @override
  String get listingId;
  @override
  ItemType get itemType;
  @override
  int? get price;
  @override
  int? get discountPrice;
  @override
  String? get description;

  /// Create a copy of UpdateListingDtoV2
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateListingDtoV2ImplCopyWith<_$UpdateListingDtoV2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
