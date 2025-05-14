// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_visit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogVisitDtoImpl _$$LogVisitDtoImplFromJson(Map<String, dynamic> json) =>
    _$LogVisitDtoImpl(
      listingId: json['listingId'] as String,
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
    );

Map<String, dynamic> _$$LogVisitDtoImplToJson(_$LogVisitDtoImpl instance) =>
    <String, dynamic>{
      'listingId': instance.listingId,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
    };

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};
