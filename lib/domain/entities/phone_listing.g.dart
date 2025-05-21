// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneListingImpl _$$PhoneListingImplFromJson(Map<String, dynamic> json) =>
    _$PhoneListingImpl(
      id: json['id'] as String,
      item: PhoneNumber.fromJson(json['item'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt() ?? 0,
      discountPrice: (json['discountPrice'] as num?)?.toInt() ?? 0,
      priceNegotiable: json['priceNegotiable'] as bool? ?? false,
      isDisabled: json['isDisabled'] as bool? ?? true,
      isSold: json['isSold'] as bool? ?? false,
      featuredUntil: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['featuredUntil'], const TimestampConverter().fromJson),
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      expiresAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['expiresAt'], const TimestampConverter().fromJson),
      visits: (json['visits'] as num?)?.toInt() ?? 0,
      userId: json['userId'] as String,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$PhoneListingImplToJson(_$PhoneListingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'priceNegotiable': instance.priceNegotiable,
      'isDisabled': instance.isDisabled,
      'isSold': instance.isSold,
      'featuredUntil': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.featuredUntil, const TimestampConverter().toJson),
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'expiresAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.expiresAt, const TimestampConverter().toJson),
      'visits': instance.visits,
      'userId': instance.userId,
      'description': instance.description,
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
