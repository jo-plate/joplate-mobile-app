import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';

part 'user_favorites.freezed.dart';
part 'user_favorites.g.dart';

@freezed
class UserFavorites with _$UserFavorites {
  const UserFavorites._();

  const factory UserFavorites({
    @Default([]) List<String> favoritePhones,
    @Default([]) List<String> favoritePlates,
    @Default([]) List<Listing<PhoneNumber>> favoritePhoneListings,
    @Default([]) List<Listing<PlateNumber>> favoritePlateListings,
  }) = _UserFavorites;

  factory UserFavorites.fromJson(Map<String, dynamic> json) => _$UserFavoritesFromJson(json);
}
