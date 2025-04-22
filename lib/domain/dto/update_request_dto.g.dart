// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateRequestDtoImpl _$$UpdateRequestDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateRequestDtoImpl(
      id: json['id'] as String,
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$UpdateRequestDtoImplToJson(
        _$UpdateRequestDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'data': instance.data,
    };

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};
