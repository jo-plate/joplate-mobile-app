// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListingImpl<T> _$$ListingImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ListingImpl<T>(
      item: fromJsonT(json['item']),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      price: json['price'] as String,
      userId: json['userId'] as String? ?? '',
      description: json['description'] as String? ?? '',
      priceNegotiable: json['priceNegotiable'] as bool? ?? false,
      priceHidden: json['priceHidden'] ?? false,
    );

Map<String, dynamic> _$$ListingImplToJson<T>(
  _$ListingImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'item': toJsonT(instance.item),
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
      'price': instance.price,
      'userId': instance.userId,
      'description': instance.description,
      'priceNegotiable': instance.priceNegotiable,
      'priceHidden': instance.priceHidden,
    };

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};
