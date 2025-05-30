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
    @Default(0) int visits,
    @Default('') String description,
  }) = _PlateListing;

  bool get isFeatured => featuredUntil?.isAfter(DateTime.now()) ?? false;
  bool get isActive => !isDisabled && !isExpired;
  bool get isExpired => expiresAt?.isBefore(DateTime.now()) ?? false;
  bool get priceHidden => discountPrice == 0 && price == 0;

  factory PlateListing.fromJson(Map<String, dynamic> json) => _$PlateListingFromJson(json);
  factory PlateListing.fromSnapshot(DocumentSnapshot snapshot) =>
      PlateListing.fromJson({'id': snapshot.id, ...snapshot.data() as Map<String, dynamic>});

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
}
