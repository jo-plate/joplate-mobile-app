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
      featuredUntil: json['featuredUntil'] == null
          ? null
          : DateTime.parse(json['featuredUntil'] as String),
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
      'isDisabled': instance.isDisabled,
      'isSold': instance.isSold,
      'featuredUntil': instance.featuredUntil?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'userId': instance.userId,
    };
