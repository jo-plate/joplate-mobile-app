// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListingImpl<T> _$$ListingImplFromJson<T>(Map<String, dynamic> json) =>
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
      phoneNumber: json['phoneNumber'] == null
          ? null
          : PhoneNumber.fromJson(json['phoneNumber'] as Map<String, dynamic>),
      plateNumber: json['plateNumber'] == null
          ? null
          : PlateNumber.fromJson(json['plateNumber'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ListingImplToJson<T>(_$ListingImpl<T> instance) =>
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
      'phoneNumber': instance.phoneNumber,
      'plateNumber': instance.plateNumber,
    };

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};
