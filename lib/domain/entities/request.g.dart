// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneRequestImpl _$$PhoneRequestImplFromJson(Map<String, dynamic> json) =>
    _$PhoneRequestImpl(
      id: json['id'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      isDisabled: json['isDisabled'] as bool? ?? false,
      userId: json['userId'] as String,
      item: PhoneNumber.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PhoneRequestImplToJson(_$PhoneRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'isDisabled': instance.isDisabled,
      'userId': instance.userId,
      'item': instance.item,
    };

_$PlateRequestImpl _$$PlateRequestImplFromJson(Map<String, dynamic> json) =>
    _$PlateRequestImpl(
      id: json['id'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      isDisabled: json['isDisabled'] as bool? ?? false,
      userId: json['userId'] as String,
      item: PlateNumber.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlateRequestImplToJson(_$PlateRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'isDisabled': instance.isDisabled,
      'userId': instance.userId,
      'item': instance.item,
    };
