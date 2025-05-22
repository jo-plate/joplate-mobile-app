// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddListingDtoImpl _$$AddListingDtoImplFromJson(Map<String, dynamic> json) =>
    _$AddListingDtoImpl(
      price: (json['price'] as num).toInt(),
      discountPrice: (json['discountPrice'] as num).toInt(),
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      isFeatured: json['isFeatured'] as bool,
      item: json['item'] as Map<String, dynamic>,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$AddListingDtoImplToJson(_$AddListingDtoImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'isFeatured': instance.isFeatured,
      'item': instance.item,
      'description': instance.description,
    };

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};
