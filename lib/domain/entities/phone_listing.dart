import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/phone_number.dart';

part 'phone_listing.freezed.dart';
part 'phone_listing.g.dart';

@freezed
class PhoneListing with _$PhoneListing {
  const PhoneListing._();

  const factory PhoneListing({
    required String id,
    required PhoneNumber item,
    @Default(0.0) double price,
    @Default(0.0) double discountPrice,
    @Default(false) bool priceNegotiable,
    @Default(false) bool isFeatured,
    @Default(true) bool isDisabled,
    @Default(false) bool isSold,
    DateTime? createdAt,
    DateTime? expiresAt,
    required String userId,
  }) = _PhoneListing;

  factory PhoneListing.fromJson(Map<String, dynamic> json) => _$PhoneListingFromJson(json);

  bool get priceHidden => discountPrice == 0 && price == 0;

  static PhoneListing mockListing() {
    return PhoneListing(
        item: const PhoneNumber(number: "0787940864"),
        id: "mockUserId",
        price: 15000.0,
        discountPrice: 14000.0,
        priceNegotiable: true,
        isFeatured: true,
        isDisabled: false,
        isSold: false,
        createdAt: DateTime.now(),
        expiresAt: DateTime.now().add(const Duration(days: 7)),
        userId: 'mockUserId');
  }

  bool get isExpired {
    if (expiresAt == null) return false;
    return expiresAt!.isBefore(DateTime.now());
  }
}
