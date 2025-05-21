// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateListingDtoV2Impl _$$UpdateListingDtoV2ImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateListingDtoV2Impl(
      listingId: json['listingId'] as String,
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      price: (json['price'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$UpdateListingDtoV2ImplToJson(
        _$UpdateListingDtoV2Impl instance) =>
    <String, dynamic>{
      'listingId': instance.listingId,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'description': instance.description,
    };

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};
