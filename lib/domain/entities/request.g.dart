// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestImpl<T> _$$RequestImplFromJson<T>(Map<String, dynamic> json) =>
    _$RequestImpl<T>(
      id: json['id'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      priceHidden: json['priceHidden'] as bool? ?? false,
      isSold: json['isSold'] as bool? ?? false,
      userId: json['userId'] as String,
      phoneNumber: json['phoneNumber'] == null
          ? null
          : PhoneNumber.fromJson(json['phoneNumber'] as Map<String, dynamic>),
      plateNumber: json['plateNumber'] == null
          ? null
          : PlateNumber.fromJson(json['plateNumber'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RequestImplToJson<T>(_$RequestImpl<T> instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'priceHidden': instance.priceHidden,
      'isSold': instance.isSold,
      'userId': instance.userId,
      'phoneNumber': instance.phoneNumber,
      'plateNumber': instance.plateNumber,
    };

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};
