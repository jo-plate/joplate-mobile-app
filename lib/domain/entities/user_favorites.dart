import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';

part 'user_favorites.freezed.dart';
part 'user_favorites.g.dart';

@freezed
class UserFavorites with _$UserFavorites {
  const UserFavorites._();

  const factory UserFavorites({
    @Default([]) List<String> favoritePhonesIds,
    @Default([]) List<String> favoritePlatesIds,
    @Default([]) List<PhoneNumber> favoritePhones,
    @Default([]) List<PlateNumber> favoritePlates,
  }) = _UserFavorites;

  factory UserFavorites.fromJson(Map<String, dynamic> json) => _$UserFavoritesFromJson(json);
}
