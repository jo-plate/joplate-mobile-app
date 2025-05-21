import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/utils/converters.dart';

part 'phone_listing.freezed.dart';
part 'phone_listing.g.dart';

@freezed
class PhoneListing with _$PhoneListing {
  const PhoneListing._();

  const factory PhoneListing({
    required String id,
    required PhoneNumber item,
    @Default(0) int price,
    @Default(0) int discountPrice,
    @Default(false) bool priceNegotiable,
    @Default(true) bool isDisabled,
    @Default(false) bool isSold,
    @TimestampConverter() DateTime? featuredUntil,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? expiresAt,
    @Default(0) int visits,
    required String userId,
    @Default('') String description,
  }) = _PhoneListing;

  bool get isFeatured => featuredUntil != null && featuredUntil!.isAfter(DateTime.now());
  bool get isActive => !isDisabled && !isExpired;
  bool get isExpired => expiresAt != null && expiresAt!.isBefore(DateTime.now());

  factory PhoneListing.fromJson(Map<String, dynamic> json) =>
      _$PhoneListingFromJson(json);
  factory PhoneListing.fromSnapshot(DocumentSnapshot snapshot) =>
      PhoneListing.fromJson(
          {'id': snapshot.id, ...snapshot.data() as Map<String, dynamic>});

  bool get priceHidden => discountPrice == 0 && price == 0;

  static PhoneListing mockListing() {
    return PhoneListing(
        item: const PhoneNumber(number: "0787940864"),
        id: "mockUserId",
        price: 15000,
        discountPrice: 14000,
        priceNegotiable: true,
        isDisabled: false,
        isSold: false,
        createdAt: DateTime.now(),
        expiresAt: DateTime.now().add(const Duration(days: 7)),
        userId: 'mockUserId');
  }
}
