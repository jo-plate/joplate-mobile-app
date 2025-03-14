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

Listing<T> _$ListingFromJson<T>(Map<String, dynamic> json) {
  return _Listing<T>.fromJson(json);
}

/// @nodoc
mixin _$Listing<T> {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get discountPrice => throw _privateConstructorUsedError;
  ListingType get listingType => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  bool get priceNegotiable => throw _privateConstructorUsedError;
  bool get priceHidden => throw _privateConstructorUsedError;
  bool get isFeatured => throw _privateConstructorUsedError;
  UserProfile get postedBy => throw _privateConstructorUsedError;
  PhoneNumber? get phoneNumber => throw _privateConstructorUsedError;
  PlateNumber? get plateNumber => throw _privateConstructorUsedError;

  /// Serializes this Listing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

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
      double? discountPrice,
      ListingType listingType,
      ItemType itemType,
      bool priceNegotiable,
      bool priceHidden,
      bool isFeatured,
      UserProfile postedBy,
      PhoneNumber? phoneNumber,
      PlateNumber? plateNumber});

  $UserProfileCopyWith<$Res> get postedBy;
  $PhoneNumberCopyWith<$Res>? get phoneNumber;
  $PlateNumberCopyWith<$Res>? get plateNumber;
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
    Object? discountPrice = freezed,
    Object? listingType = null,
    Object? itemType = null,
    Object? priceNegotiable = null,
    Object? priceHidden = null,
    Object? isFeatured = null,
    Object? postedBy = null,
    Object? phoneNumber = freezed,
    Object? plateNumber = freezed,
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
      postedBy: null == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as PlateNumber?,
    ) as $Val);
  }

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get postedBy {
    return $UserProfileCopyWith<$Res>(_value.postedBy, (value) {
      return _then(_value.copyWith(postedBy: value) as $Val);
    });
  }

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhoneNumberCopyWith<$Res>? get phoneNumber {
    if (_value.phoneNumber == null) {
      return null;
    }

    return $PhoneNumberCopyWith<$Res>(_value.phoneNumber!, (value) {
      return _then(_value.copyWith(phoneNumber: value) as $Val);
    });
  }

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlateNumberCopyWith<$Res>? get plateNumber {
    if (_value.plateNumber == null) {
      return null;
    }

    return $PlateNumberCopyWith<$Res>(_value.plateNumber!, (value) {
      return _then(_value.copyWith(plateNumber: value) as $Val);
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
      double? discountPrice,
      ListingType listingType,
      ItemType itemType,
      bool priceNegotiable,
      bool priceHidden,
      bool isFeatured,
      UserProfile postedBy,
      PhoneNumber? phoneNumber,
      PlateNumber? plateNumber});

  @override
  $UserProfileCopyWith<$Res> get postedBy;
  @override
  $PhoneNumberCopyWith<$Res>? get phoneNumber;
  @override
  $PlateNumberCopyWith<$Res>? get plateNumber;
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
    Object? discountPrice = freezed,
    Object? listingType = null,
    Object? itemType = null,
    Object? priceNegotiable = null,
    Object? priceHidden = null,
    Object? isFeatured = null,
    Object? postedBy = null,
    Object? phoneNumber = freezed,
    Object? plateNumber = freezed,
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
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double?,
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
      postedBy: null == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as PlateNumber?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListingImpl<T> extends _Listing<T> {
  _$ListingImpl(
      {required this.id,
      this.price = 0,
      this.discountPrice,
      this.listingType = ListingType.ad,
      required this.itemType,
      this.priceNegotiable = false,
      this.priceHidden = false,
      this.isFeatured = false,
      this.postedBy = const UserProfile(),
      this.phoneNumber,
      this.plateNumber})
      : super._();

  factory _$ListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListingImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final double price;
  @override
  final double? discountPrice;
  @override
  @JsonKey()
  final ListingType listingType;
  @override
  final ItemType itemType;
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
  final UserProfile postedBy;
  @override
  final PhoneNumber? phoneNumber;
  @override
  final PlateNumber? plateNumber;

  @override
  String toString() {
    return 'Listing<$T>(id: $id, price: $price, discountPrice: $discountPrice, listingType: $listingType, itemType: $itemType, priceNegotiable: $priceNegotiable, priceHidden: $priceHidden, isFeatured: $isFeatured, postedBy: $postedBy, phoneNumber: $phoneNumber, plateNumber: $plateNumber)';
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
            (identical(other.postedBy, postedBy) ||
                other.postedBy == postedBy) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      price,
      discountPrice,
      listingType,
      itemType,
      priceNegotiable,
      priceHidden,
      isFeatured,
      postedBy,
      phoneNumber,
      plateNumber);

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingImplCopyWith<T, _$ListingImpl<T>> get copyWith =>
      __$$ListingImplCopyWithImpl<T, _$ListingImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListingImplToJson<T>(
      this,
    );
  }
}

abstract class _Listing<T> extends Listing<T> {
  factory _Listing(
      {required final String id,
      final double price,
      final double? discountPrice,
      final ListingType listingType,
      required final ItemType itemType,
      final bool priceNegotiable,
      final bool priceHidden,
      final bool isFeatured,
      final UserProfile postedBy,
      final PhoneNumber? phoneNumber,
      final PlateNumber? plateNumber}) = _$ListingImpl<T>;
  _Listing._() : super._();

  factory _Listing.fromJson(Map<String, dynamic> json) =
      _$ListingImpl<T>.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  double? get discountPrice;
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
  UserProfile get postedBy;
  @override
  PhoneNumber? get phoneNumber;
  @override
  PlateNumber? get plateNumber;

  /// Create a copy of Listing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingImplCopyWith<T, _$ListingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
