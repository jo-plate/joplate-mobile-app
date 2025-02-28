// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddListingDtoImpl _$$AddListingDtoImplFromJson(Map<String, dynamic> json) =>
    _$AddListingDtoImpl(
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num).toDouble(),
      userId: json['userId'] as String,
      listingType: $enumDecode(_$ListingTypeEnumMap, json['listingType']),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      priceNegotiable: json['priceNegotiable'] as bool,
      priceHidden: json['priceHidden'] as bool,
      isFeatured: json['isFeatured'] as bool,
      itemData: _$JsonConverterFromJson<Map<String, dynamic>, dynamic>(
          json['itemData'], const PhoneOrPlateConverter().fromJson),
    );

Map<String, dynamic> _$$AddListingDtoImplToJson(_$AddListingDtoImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'userId': instance.userId,
      'listingType': _$ListingTypeEnumMap[instance.listingType]!,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'priceNegotiable': instance.priceNegotiable,
      'priceHidden': instance.priceHidden,
      'isFeatured': instance.isFeatured,
      'itemData': const PhoneOrPlateConverter().toJson(instance.itemData),
    };

const _$ListingTypeEnumMap = {
  ListingType.request: 'request',
  ListingType.ad: 'ad',
};

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
