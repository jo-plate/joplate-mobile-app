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
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num).toDouble(),
      userId: json['userId'] as String,
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      priceNegotiable: json['priceNegotiable'] as bool,
      priceHidden: json['priceHidden'] as bool,
      isFeatured: json['isFeatured'] as bool,
      seller: UserProfile.fromJson(json['seller'] as Map<String, dynamic>),
      itemData: fromJsonT(json['itemData']),
    );

Map<String, dynamic> _$$ListingImplToJson<T>(
  _$ListingImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'userId': instance.userId,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'priceNegotiable': instance.priceNegotiable,
      'priceHidden': instance.priceHidden,
      'isFeatured': instance.isFeatured,
      'seller': instance.seller,
      'itemData': toJsonT(instance.itemData),
    };

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};
