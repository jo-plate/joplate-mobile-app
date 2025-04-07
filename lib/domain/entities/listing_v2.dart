import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/user_profile.dart';

part 'listing_v2.freezed.dart';
part 'listing_v2.g.dart';

@freezed
class ListingV2 with _$ListingV2 {
  const ListingV2._();

  const factory ListingV2({
    required String id,
    required double price,
    @Default(0.0) double discountPrice,
    @Default(false) bool priceNegotiable,
    @Default(false) bool priceHidden,
    @Default(false) bool isFeatured,
    @Default(true) bool isActive,
    @Default(false) bool isSold,
    required String createdAt,
    String? expiresAt,
    UserProfile? postedBy,
  }) = _ListingV2;

  factory ListingV2.fromJson(Map<String, dynamic> json) => _$ListingV2FromJson(json);

  static ListingV2 mockAd() {
    return ListingV2(
      id: "mockUserId",
      price: 15000.0,
      discountPrice: 14000.0,
      priceNegotiable: true,
      priceHidden: false,
      isFeatured: true,
      isActive: true,
      isSold: false,
      createdAt: DateTime.now().toIso8601String(),
      expiresAt: DateTime.now().add(const Duration(days: 7)).toIso8601String(),
      postedBy: UserProfile.empty().copyWith(
        displayName: "mockUser",
        email: "anasmk9@outlook.com",
        phonenumber: "+962787940864",
      ),
    );
  }

  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.parse(expiresAt!).isBefore(DateTime.now());
  }
}
