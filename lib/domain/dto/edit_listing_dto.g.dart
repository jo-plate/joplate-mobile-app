// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditListingDtoImpl _$$EditListingDtoImplFromJson(Map<String, dynamic> json) =>
    _$EditListingDtoImpl(
      listingId: json['listingId'] as String,
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      itemType: $enumDecode(_$ItemTypeEnumMap, json['itemType']),
      priceNegotiable: json['priceNegotiable'] as bool?,
      priceHidden: json['priceHidden'] as bool?,
      isSold: json['isSold'] as bool?,
      isFeatured: json['isFeatured'] as bool?,
      itemData: json['itemData'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$EditListingDtoImplToJson(
        _$EditListingDtoImpl instance) =>
    <String, dynamic>{
      'listingId': instance.listingId,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'itemType': _$ItemTypeEnumMap[instance.itemType]!,
      'priceNegotiable': instance.priceNegotiable,
      'priceHidden': instance.priceHidden,
      'isSold': instance.isSold,
      'isFeatured': instance.isFeatured,
      'itemData': instance.itemData,
    };

const _$ItemTypeEnumMap = {
  ItemType.plateNumber: 'plateNumber',
  ItemType.phoneNumber: 'phoneNumber',
};
