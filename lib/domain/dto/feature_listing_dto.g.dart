// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureListingDtoImpl _$$FeatureListingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureListingDtoImpl(
      listingId: json['listingId'] as String,
      itemType: json['itemType'] as String,
      goldenTicket: json['goldenTicket'] as bool?,
      iapData: json['iapData'] == null
          ? null
          : IAPData.fromJson(json['iapData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeatureListingDtoImplToJson(
        _$FeatureListingDtoImpl instance) =>
    <String, dynamic>{
      'listingId': instance.listingId,
      'itemType': instance.itemType,
      'goldenTicket': instance.goldenTicket,
      'iapData': instance.iapData,
    };

_$IAPDataImpl _$$IAPDataImplFromJson(Map<String, dynamic> json) =>
    _$IAPDataImpl(
      productId: json['productId'] as String,
      transactionId: json['transactionId'] as String,
      purchaseToken: json['purchaseToken'] as String,
      receipt: json['receipt'] as String?,
    );

Map<String, dynamic> _$$IAPDataImplToJson(_$IAPDataImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'transactionId': instance.transactionId,
      'purchaseToken': instance.purchaseToken,
      'receipt': instance.receipt,
    };
