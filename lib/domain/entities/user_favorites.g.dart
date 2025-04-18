// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_favorites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFavoritesImpl _$$UserFavoritesImplFromJson(Map<String, dynamic> json) =>
    _$UserFavoritesImpl(
      favoritePhonesIds: (json['favoritePhonesIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoritePlatesIds: (json['favoritePlatesIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favoritePhones: (json['favoritePhones'] as List<dynamic>?)
              ?.map((e) => PhoneListing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      favoritePlates: (json['favoritePlates'] as List<dynamic>?)
              ?.map((e) => PlateListing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserFavoritesImplToJson(_$UserFavoritesImpl instance) =>
    <String, dynamic>{
      'favoritePhonesIds': instance.favoritePhonesIds,
      'favoritePlatesIds': instance.favoritePlatesIds,
      'favoritePhones': instance.favoritePhones,
      'favoritePlates': instance.favoritePlates,
    };
