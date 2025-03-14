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
  @PhoneOrPlateConverter()
  dynamic get itemData => throw _privateConstructorUsedError;

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
      @PhoneOrPlateConverter() dynamic itemData});
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
    Object? itemData = freezed,
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
      itemData: freezed == itemData
          ? _value.itemData
          : itemData // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      @PhoneOrPlateConverter() dynamic itemData});
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
    Object? itemData = freezed,
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
      itemData: freezed == itemData
          ? _value.itemData
          : itemData // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      @PhoneOrPlateConverter() required this.itemData});

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
  @override
  @PhoneOrPlateConverter()
  final dynamic itemData;

  @override
  String toString() {
    return 'AddListingDto(price: $price, discountPrice: $discountPrice, listingType: $listingType, itemType: $itemType, priceNegotiable: $priceNegotiable, priceHidden: $priceHidden, isFeatured: $isFeatured, itemData: $itemData)';
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
            const DeepCollectionEquality().equals(other.itemData, itemData));
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
      const DeepCollectionEquality().hash(itemData));

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
          @PhoneOrPlateConverter() required final dynamic itemData}) =
      _$AddListingDtoImpl;

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
  @PhoneOrPlateConverter()
  dynamic get itemData;

  /// Create a copy of AddListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddListingDtoImplCopyWith<_$AddListingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateListingDto _$UpdateListingDtoFromJson(Map<String, dynamic> json) {
  return _UpdateListingDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateListingDto {
  String get listingId => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  bool? get priceNegotiable => throw _privateConstructorUsedError;
  bool? get priceHidden => throw _privateConstructorUsedError;
  bool? get isFeatured => throw _privateConstructorUsedError;

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
      double? price,
      double? discountPrice,
      bool? priceNegotiable,
      bool? priceHidden,
      bool? isFeatured});
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
    Object? price = freezed,
    Object? discountPrice = freezed,
    Object? priceNegotiable = freezed,
    Object? priceHidden = freezed,
    Object? isFeatured = freezed,
  }) {
    return _then(_value.copyWith(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      priceNegotiable: freezed == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      priceHidden: freezed == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
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
      double? price,
      double? discountPrice,
      bool? priceNegotiable,
      bool? priceHidden,
      bool? isFeatured});
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
    Object? price = freezed,
    Object? discountPrice = freezed,
    Object? priceNegotiable = freezed,
    Object? priceHidden = freezed,
    Object? isFeatured = freezed,
  }) {
    return _then(_$UpdateListingDtoImpl(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      priceNegotiable: freezed == priceNegotiable
          ? _value.priceNegotiable
          : priceNegotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      priceHidden: freezed == priceHidden
          ? _value.priceHidden
          : priceHidden // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateListingDtoImpl implements _UpdateListingDto {
  const _$UpdateListingDtoImpl(
      {required this.listingId,
      this.price,
      this.discountPrice,
      this.priceNegotiable,
      this.priceHidden,
      this.isFeatured});

  factory _$UpdateListingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateListingDtoImplFromJson(json);

  @override
  final String listingId;
  @override
  final double? price;
  @override
  final double? discountPrice;
  @override
  final bool? priceNegotiable;
  @override
  final bool? priceHidden;
  @override
  final bool? isFeatured;

  @override
  String toString() {
    return 'UpdateListingDto(listingId: $listingId, price: $price, discountPrice: $discountPrice, priceNegotiable: $priceNegotiable, priceHidden: $priceHidden, isFeatured: $isFeatured)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateListingDtoImpl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.priceNegotiable, priceNegotiable) ||
                other.priceNegotiable == priceNegotiable) &&
            (identical(other.priceHidden, priceHidden) ||
                other.priceHidden == priceHidden) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, listingId, price, discountPrice,
      priceNegotiable, priceHidden, isFeatured);

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

abstract class _UpdateListingDto implements UpdateListingDto {
  const factory _UpdateListingDto(
      {required final String listingId,
      final double? price,
      final double? discountPrice,
      final bool? priceNegotiable,
      final bool? priceHidden,
      final bool? isFeatured}) = _$UpdateListingDtoImpl;

  factory _UpdateListingDto.fromJson(Map<String, dynamic> json) =
      _$UpdateListingDtoImpl.fromJson;

  @override
  String get listingId;
  @override
  double? get price;
  @override
  double? get discountPrice;
  @override
  bool? get priceNegotiable;
  @override
  bool? get priceHidden;
  @override
  bool? get isFeatured;

  /// Create a copy of UpdateListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateListingDtoImplCopyWith<_$UpdateListingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteListingDto _$DeleteListingDtoFromJson(Map<String, dynamic> json) {
  return _DeleteListingDto.fromJson(json);
}

/// @nodoc
mixin _$DeleteListingDto {
  String get listingId => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;

  /// Serializes this DeleteListingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteListingDtoCopyWith<DeleteListingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteListingDtoCopyWith<$Res> {
  factory $DeleteListingDtoCopyWith(
          DeleteListingDto value, $Res Function(DeleteListingDto) then) =
      _$DeleteListingDtoCopyWithImpl<$Res, DeleteListingDto>;
  @useResult
  $Res call({String listingId, bool disabled});
}

/// @nodoc
class _$DeleteListingDtoCopyWithImpl<$Res, $Val extends DeleteListingDto>
    implements $DeleteListingDtoCopyWith<$Res> {
  _$DeleteListingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? disabled = null,
  }) {
    return _then(_value.copyWith(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteListingDtoImplCopyWith<$Res>
    implements $DeleteListingDtoCopyWith<$Res> {
  factory _$$DeleteListingDtoImplCopyWith(_$DeleteListingDtoImpl value,
          $Res Function(_$DeleteListingDtoImpl) then) =
      __$$DeleteListingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String listingId, bool disabled});
}

/// @nodoc
class __$$DeleteListingDtoImplCopyWithImpl<$Res>
    extends _$DeleteListingDtoCopyWithImpl<$Res, _$DeleteListingDtoImpl>
    implements _$$DeleteListingDtoImplCopyWith<$Res> {
  __$$DeleteListingDtoImplCopyWithImpl(_$DeleteListingDtoImpl _value,
      $Res Function(_$DeleteListingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? disabled = null,
  }) {
    return _then(_$DeleteListingDtoImpl(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteListingDtoImpl implements _DeleteListingDto {
  const _$DeleteListingDtoImpl(
      {required this.listingId, required this.disabled});

  factory _$DeleteListingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteListingDtoImplFromJson(json);

  @override
  final String listingId;
  @override
  final bool disabled;

  @override
  String toString() {
    return 'DeleteListingDto(listingId: $listingId, disabled: $disabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteListingDtoImpl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, listingId, disabled);

  /// Create a copy of DeleteListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteListingDtoImplCopyWith<_$DeleteListingDtoImpl> get copyWith =>
      __$$DeleteListingDtoImplCopyWithImpl<_$DeleteListingDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteListingDtoImplToJson(
      this,
    );
  }
}

abstract class _DeleteListingDto implements DeleteListingDto {
  const factory _DeleteListingDto(
      {required final String listingId,
      required final bool disabled}) = _$DeleteListingDtoImpl;

  factory _DeleteListingDto.fromJson(Map<String, dynamic> json) =
      _$DeleteListingDtoImpl.fromJson;

  @override
  String get listingId;
  @override
  bool get disabled;

  /// Create a copy of DeleteListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteListingDtoImplCopyWith<_$DeleteListingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
