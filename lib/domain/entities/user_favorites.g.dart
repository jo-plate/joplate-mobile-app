// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_favorites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFavoritesImpl _$$UserFavoritesImplFromJson(Map<String, dynamic> json) =>
    _$UserFavoritesImpl(
      favoritePhones: (json['favoritePhones'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoritePlates: (json['favoritePlates'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoritePhoneListings: (json['favoritePhoneListings'] as List<dynamic>?)
              ?.map((e) =>
                  Listing<PhoneNumber>.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      favoritePlateListings: (json['favoritePlateListings'] as List<dynamic>?)
              ?.map((e) =>
                  Listing<PlateNumber>.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserFavoritesImplToJson(_$UserFavoritesImpl instance) =>
    <String, dynamic>{
      'favoritePhones': instance.favoritePhones,
      'favoritePlates': instance.favoritePlates,
      'favoritePhoneListings': instance.favoritePhoneListings,
      'favoritePlateListings': instance.favoritePlateListings,
    };
