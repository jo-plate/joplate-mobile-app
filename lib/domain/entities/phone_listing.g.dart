// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneListingImpl _$$PhoneListingImplFromJson(Map<String, dynamic> json) =>
    _$PhoneListingImpl(
      id: json['id'] as String,
      item: PhoneNumber.fromJson(json['item'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: (json['discountPrice'] as num?)?.toDouble() ?? 0.0,
      priceNegotiable: json['priceNegotiable'] as bool? ?? false,
      isFeatured: json['isFeatured'] as bool? ?? false,
      isDisabled: json['isDisabled'] as bool? ?? true,
      isSold: json['isSold'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$PhoneListingImplToJson(_$PhoneListingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'priceNegotiable': instance.priceNegotiable,
      'isFeatured': instance.isFeatured,
      'isDisabled': instance.isDisabled,
      'isSold': instance.isSold,
      'createdAt': instance.createdAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'userId': instance.userId,
    };
