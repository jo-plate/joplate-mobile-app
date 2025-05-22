// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlateListingImpl _$$PlateListingImplFromJson(Map<String, dynamic> json) =>
    _$PlateListingImpl(
      id: json['id'] as String,
      item: PlateNumber.fromJson(json['item'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt() ?? 0,
      discountPrice: (json['discountPrice'] as num?)?.toInt() ?? 0,
      isDisabled: json['isDisabled'] as bool? ?? true,
      isSold: json['isSold'] as bool? ?? false,
      featuredUntil: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['featuredUntil'], const TimestampConverter().fromJson),
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      expiresAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['expiresAt'], const TimestampConverter().fromJson),
      userId: json['userId'] as String,
      visits: (json['visits'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      priceHidden: json['priceHidden'] as bool? ?? false,
    );

Map<String, dynamic> _$$PlateListingImplToJson(_$PlateListingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'isDisabled': instance.isDisabled,
      'isSold': instance.isSold,
      'featuredUntil': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.featuredUntil, const TimestampConverter().toJson),
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'expiresAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.expiresAt, const TimestampConverter().toJson),
      'userId': instance.userId,
      'visits': instance.visits,
      'description': instance.description,
      'priceHidden': instance.priceHidden,
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
