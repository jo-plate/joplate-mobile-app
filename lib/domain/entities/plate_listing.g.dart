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
      userProfile: json['userProfile'] == null
          ? null
          : UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PlateListingImplToJson(_$PlateListingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'price': instance.price,
      'discountPrice': instance.discountPrice,
      'isDisabled': instance.isDisabled,
      'isSold': instance.isSold,
      'featuredUntil': instance.featuredUntil?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'userId': instance.userId,
      'userProfile': instance.userProfile,
    };
