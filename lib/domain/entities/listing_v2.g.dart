// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListingV2Impl _$$ListingV2ImplFromJson(Map<String, dynamic> json) =>
    _$ListingV2Impl(
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      priceNegotiable: json['priceNegotiable'] as bool? ?? false,
      priceHidden: json['priceHidden'] as bool? ?? false,
      isFeatured: json['isFeatured'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      isSold: json['isSold'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      postedBy: json['postedBy'] == null
          ? null
          : UserProfile.fromJson(json['postedBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ListingV2ImplToJson(_$ListingV2Impl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'priceNegotiable': instance.priceNegotiable,
      'priceHidden': instance.priceHidden,
      'isFeatured': instance.isFeatured,
      'isActive': instance.isActive,
      'isSold': instance.isSold,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'postedBy': instance.postedBy,
    };
