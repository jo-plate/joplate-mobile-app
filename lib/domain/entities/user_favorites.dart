import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/domain/entities/plate_listing.dart';

part 'user_favorites.freezed.dart';
part 'user_favorites.g.dart';

@freezed
class UserFavorites with _$UserFavorites {
  const UserFavorites._();

  const factory UserFavorites({
    @Default([]) List<String> favoritePhonesIds,
    @Default([]) List<String> favoritePlatesIds,
    @Default([]) List<PhoneListing> favoritePhones,
    @Default([]) List<PlateListing> favoritePlates,
  }) = _UserFavorites;

  factory UserFavorites.fromJson(Map<String, dynamic> json) => _$UserFavoritesFromJson(json);
}
