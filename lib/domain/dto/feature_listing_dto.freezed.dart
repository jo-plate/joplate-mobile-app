// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_listing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeatureListingDto _$FeatureListingDtoFromJson(Map<String, dynamic> json) {
  return _FeatureListingDto.fromJson(json);
}

/// @nodoc
mixin _$FeatureListingDto {
  String get listingId => throw _privateConstructorUsedError;
  String get itemType => throw _privateConstructorUsedError;
  bool? get goldenTicket => throw _privateConstructorUsedError;
  IAPData? get iapData => throw _privateConstructorUsedError;

  /// Serializes this FeatureListingDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeatureListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeatureListingDtoCopyWith<FeatureListingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureListingDtoCopyWith<$Res> {
  factory $FeatureListingDtoCopyWith(
          FeatureListingDto value, $Res Function(FeatureListingDto) then) =
      _$FeatureListingDtoCopyWithImpl<$Res, FeatureListingDto>;
  @useResult
  $Res call(
      {String listingId,
      String itemType,
      bool? goldenTicket,
      IAPData? iapData});

  $IAPDataCopyWith<$Res>? get iapData;
}

/// @nodoc
class _$FeatureListingDtoCopyWithImpl<$Res, $Val extends FeatureListingDto>
    implements $FeatureListingDtoCopyWith<$Res> {
  _$FeatureListingDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeatureListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? itemType = null,
    Object? goldenTicket = freezed,
    Object? iapData = freezed,
  }) {
    return _then(_value.copyWith(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String,
      goldenTicket: freezed == goldenTicket
          ? _value.goldenTicket
          : goldenTicket // ignore: cast_nullable_to_non_nullable
              as bool?,
      iapData: freezed == iapData
          ? _value.iapData
          : iapData // ignore: cast_nullable_to_non_nullable
              as IAPData?,
    ) as $Val);
  }

  /// Create a copy of FeatureListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IAPDataCopyWith<$Res>? get iapData {
    if (_value.iapData == null) {
      return null;
    }

    return $IAPDataCopyWith<$Res>(_value.iapData!, (value) {
      return _then(_value.copyWith(iapData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeatureListingDtoImplCopyWith<$Res>
    implements $FeatureListingDtoCopyWith<$Res> {
  factory _$$FeatureListingDtoImplCopyWith(_$FeatureListingDtoImpl value,
          $Res Function(_$FeatureListingDtoImpl) then) =
      __$$FeatureListingDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String listingId,
      String itemType,
      bool? goldenTicket,
      IAPData? iapData});

  @override
  $IAPDataCopyWith<$Res>? get iapData;
}

/// @nodoc
class __$$FeatureListingDtoImplCopyWithImpl<$Res>
    extends _$FeatureListingDtoCopyWithImpl<$Res, _$FeatureListingDtoImpl>
    implements _$$FeatureListingDtoImplCopyWith<$Res> {
  __$$FeatureListingDtoImplCopyWithImpl(_$FeatureListingDtoImpl _value,
      $Res Function(_$FeatureListingDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeatureListingDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? itemType = null,
    Object? goldenTicket = freezed,
    Object? iapData = freezed,
  }) {
    return _then(_$FeatureListingDtoImpl(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String,
      goldenTicket: freezed == goldenTicket
          ? _value.goldenTicket
          : goldenTicket // ignore: cast_nullable_to_non_nullable
              as bool?,
      iapData: freezed == iapData
          ? _value.iapData
          : iapData // ignore: cast_nullable_to_non_nullable
              as IAPData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureListingDtoImpl implements _FeatureListingDto {
  const _$FeatureListingDtoImpl(
      {required this.listingId,
      required this.itemType,
      this.goldenTicket,
      this.iapData});

  factory _$FeatureListingDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureListingDtoImplFromJson(json);

  @override
  final String listingId;
  @override
  final String itemType;
  @override
  final bool? goldenTicket;
  @override
  final IAPData? iapData;

  @override
  String toString() {
    return 'FeatureListingDto(listingId: $listingId, itemType: $itemType, goldenTicket: $goldenTicket, iapData: $iapData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureListingDtoImpl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.goldenTicket, goldenTicket) ||
                other.goldenTicket == goldenTicket) &&
            (identical(other.iapData, iapData) || other.iapData == iapData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, listingId, itemType, goldenTicket, iapData);

  /// Create a copy of FeatureListingDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureListingDtoImplCopyWith<_$FeatureListingDtoImpl> get copyWith =>
      __$$FeatureListingDtoImplCopyWithImpl<_$FeatureListingDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureListingDtoImplToJson(
      this,
    );
  }
}

abstract class _FeatureListingDto implements FeatureListingDto {
  const factory _FeatureListingDto(
      {required final String listingId,
      required final String itemType,
      final bool? goldenTicket,
      final IAPData? iapData}) = _$FeatureListingDtoImpl;

  factory _FeatureListingDto.fromJson(Map<String, dynamic> json) =
      _$FeatureListingDtoImpl.fromJson;

  @override
  String get listingId;
  @override
  String get itemType;
  @override
  bool? get goldenTicket;
  @override
  IAPData? get iapData;

  /// Create a copy of FeatureListingDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeatureListingDtoImplCopyWith<_$FeatureListingDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IAPData _$IAPDataFromJson(Map<String, dynamic> json) {
  return _IAPData.fromJson(json);
}

/// @nodoc
mixin _$IAPData {
  String get productId => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;
  String get purchaseToken => throw _privateConstructorUsedError;
  String? get receipt => throw _privateConstructorUsedError;

  /// Serializes this IAPData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IAPData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IAPDataCopyWith<IAPData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IAPDataCopyWith<$Res> {
  factory $IAPDataCopyWith(IAPData value, $Res Function(IAPData) then) =
      _$IAPDataCopyWithImpl<$Res, IAPData>;
  @useResult
  $Res call(
      {String productId,
      String transactionId,
      String purchaseToken,
      String? receipt});
}

/// @nodoc
class _$IAPDataCopyWithImpl<$Res, $Val extends IAPData>
    implements $IAPDataCopyWith<$Res> {
  _$IAPDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IAPData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? transactionId = null,
    Object? purchaseToken = null,
    Object? receipt = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseToken: null == purchaseToken
          ? _value.purchaseToken
          : purchaseToken // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: freezed == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IAPDataImplCopyWith<$Res> implements $IAPDataCopyWith<$Res> {
  factory _$$IAPDataImplCopyWith(
          _$IAPDataImpl value, $Res Function(_$IAPDataImpl) then) =
      __$$IAPDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String transactionId,
      String purchaseToken,
      String? receipt});
}

/// @nodoc
class __$$IAPDataImplCopyWithImpl<$Res>
    extends _$IAPDataCopyWithImpl<$Res, _$IAPDataImpl>
    implements _$$IAPDataImplCopyWith<$Res> {
  __$$IAPDataImplCopyWithImpl(
      _$IAPDataImpl _value, $Res Function(_$IAPDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of IAPData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? transactionId = null,
    Object? purchaseToken = null,
    Object? receipt = freezed,
  }) {
    return _then(_$IAPDataImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseToken: null == purchaseToken
          ? _value.purchaseToken
          : purchaseToken // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: freezed == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IAPDataImpl implements _IAPData {
  const _$IAPDataImpl(
      {required this.productId,
      required this.transactionId,
      required this.purchaseToken,
      this.receipt});

  factory _$IAPDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$IAPDataImplFromJson(json);

  @override
  final String productId;
  @override
  final String transactionId;
  @override
  final String purchaseToken;
  @override
  final String? receipt;

  @override
  String toString() {
    return 'IAPData(productId: $productId, transactionId: $transactionId, purchaseToken: $purchaseToken, receipt: $receipt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IAPDataImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.purchaseToken, purchaseToken) ||
                other.purchaseToken == purchaseToken) &&
            (identical(other.receipt, receipt) || other.receipt == receipt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, transactionId, purchaseToken, receipt);

  /// Create a copy of IAPData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IAPDataImplCopyWith<_$IAPDataImpl> get copyWith =>
      __$$IAPDataImplCopyWithImpl<_$IAPDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IAPDataImplToJson(
      this,
    );
  }
}

abstract class _IAPData implements IAPData {
  const factory _IAPData(
      {required final String productId,
      required final String transactionId,
      required final String purchaseToken,
      final String? receipt}) = _$IAPDataImpl;

  factory _IAPData.fromJson(Map<String, dynamic> json) = _$IAPDataImpl.fromJson;

  @override
  String get productId;
  @override
  String get transactionId;
  @override
  String get purchaseToken;
  @override
  String? get receipt;

  /// Create a copy of IAPData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IAPDataImplCopyWith<_$IAPDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
