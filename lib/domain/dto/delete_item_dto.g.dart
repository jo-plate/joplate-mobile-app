// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeleteItemDtoImpl _$$DeleteItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$DeleteItemDtoImpl(
      id: json['id'] as String,
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      isSold: json['isSold'] as bool? ?? false,
    );

Map<String, dynamic> _$$DeleteItemDtoImplToJson(_$DeleteItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
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
