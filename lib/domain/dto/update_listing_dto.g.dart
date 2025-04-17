// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateListingDtoImpl _$$UpdateListingDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateListingDtoImpl(
      listingId: json['listingId'] as String,
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      price: (json['price'] as num?)?.toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      isFeatured: json['isFeatured'] as bool?,
      isDisabled: json['isDisabled'] as bool?,
      isSold: json['isSold'] as bool?,
    );

Map<String, dynamic> _$$UpdateListingDtoImplToJson(
        _$UpdateListingDtoImpl instance) =>
    <String, dynamic>{
      'listingId': instance.listingId,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'isFeatured': instance.isFeatured,
      'isDisabled': instance.isDisabled,
      'isSold': instance.isSold,
    };

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};
