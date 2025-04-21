import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/utils/converters.dart';

part 'plate_listing.freezed.dart';
part 'plate_listing.g.dart';

@freezed
class PlateListing with _$PlateListing {
  const PlateListing._();

  const factory PlateListing({
    required String id,
    required PlateNumber item,
    @Default(0) int price,
    @Default(0) int discountPrice,
    @Default(true) bool isDisabled,
    @Default(false) bool isSold,
    @TimestampConverter() DateTime? featuredUntil,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? expiresAt,
    required String userId,
  }) = _PlateListing;

  bool get isFeatured {
    if (featuredUntil == null) return false;
    return featuredUntil!.isAfter(DateTime.now());
  }

  factory PlateListing.fromJson(Map<String, dynamic> json) =>
      _$PlateListingFromJson(json);
  factory PlateListing.fromSnapshot(DocumentSnapshot snapshot) =>
      PlateListing.fromJson(
          {'id': snapshot.id, ...snapshot.data() as Map<String, dynamic>});

  bool get priceHidden => discountPrice == 0 && price == 0;

  static PlateListing mockListing() {
    return PlateListing(
        item: const PlateNumber(code: "2", number: "22"),
        id: "mockUserId",
        price: 15000,
        discountPrice: 14000,
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
