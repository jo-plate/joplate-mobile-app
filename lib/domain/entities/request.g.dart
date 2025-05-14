// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneRequestImpl _$$PhoneRequestImplFromJson(Map<String, dynamic> json) =>
    _$PhoneRequestImpl(
      id: json['id'] as String,
      price: (json['price'] as num?)?.toInt() ?? 0,
      isDisabled: json['isDisabled'] as bool? ?? false,
      userId: json['userId'] as String,
      item: PhoneNumber.fromJson(json['item'] as Map<String, dynamic>),
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      expiresAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['expiresAt'], const TimestampConverter().fromJson),
      visits: (json['visits'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PhoneRequestImplToJson(_$PhoneRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'isDisabled': instance.isDisabled,
      'userId': instance.userId,
      'item': instance.item,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'expiresAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.expiresAt, const TimestampConverter().toJson),
      'visits': instance.visits,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$PlateRequestImpl _$$PlateRequestImplFromJson(Map<String, dynamic> json) =>
    _$PlateRequestImpl(
      id: json['id'] as String,
      price: (json['price'] as num?)?.toInt() ?? 0,
      isDisabled: json['isDisabled'] as bool? ?? false,
      userId: json['userId'] as String,
      item: PlateNumber.fromJson(json['item'] as Map<String, dynamic>),
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      expiresAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['expiresAt'], const TimestampConverter().fromJson),
      visits: (json['visits'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PlateRequestImplToJson(_$PlateRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'isDisabled': instance.isDisabled,
      'userId': instance.userId,
      'item': instance.item,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'expiresAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.expiresAt, const TimestampConverter().toJson),
      'visits': instance.visits,
    };
