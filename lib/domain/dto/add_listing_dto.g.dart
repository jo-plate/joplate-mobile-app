// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddListingDtoImpl _$$AddListingDtoImplFromJson(Map<String, dynamic> json) =>
    _$AddListingDtoImpl(
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num).toDouble(),
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      priceNegotiable: json['priceNegotiable'] as bool,
      priceHidden: json['priceHidden'] as bool,
      isFeatured: json['isFeatured'] as bool,
      itemData: json['itemData'],
    );

Map<String, dynamic> _$$AddListingDtoImplToJson(_$AddListingDtoImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'priceNegotiable': instance.priceNegotiable,
      'priceHidden': instance.priceHidden,
      'isFeatured': instance.isFeatured,
      'itemData': instance.itemData,
    };

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};

_$UpdateListingDtoImpl _$$UpdateListingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateListingDtoImpl(
      listingId: json['listingId'] as String,
      price: (json['price'] as num?)?.toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      priceNegotiable: json['priceNegotiable'] as bool?,
      priceHidden: json['priceHidden'] as bool?,
      isFeatured: json['isFeatured'] as bool?,
    );

Map<String, dynamic> _$$UpdateListingDtoImplToJson(
        _$UpdateListingDtoImpl instance) =>
    <String, dynamic>{
      'listingId': instance.listingId,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'priceNegotiable': instance.priceNegotiable,
      'priceHidden': instance.priceHidden,
      'isFeatured': instance.isFeatured,
    };

_$DeleteListingDtoImpl _$$DeleteListingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteListingDtoImpl(
      listingId: json['listingId'] as String,
      disabled: json['disabled'] as bool,
    );

Map<String, dynamic> _$$DeleteListingDtoImplToJson(
        _$DeleteListingDtoImpl instance) =>
    <String, dynamic>{
      'listingId': instance.listingId,
      'disabled': instance.disabled,
    };
