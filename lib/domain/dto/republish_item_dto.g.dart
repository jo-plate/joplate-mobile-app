// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'republish_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepublishItemDtoImpl _$$RepublishItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RepublishItemDtoImpl(
      id: json['id'] as String,
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
    );

Map<String, dynamic> _$$RepublishItemDtoImplToJson(
        _$RepublishItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
    };

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};
