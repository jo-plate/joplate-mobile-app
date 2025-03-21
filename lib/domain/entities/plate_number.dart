import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/listing_v2.dart';

part 'plate_number.freezed.dart';
part 'plate_number.g.dart';

@freezed
class PlateNumber with _$PlateNumber {
  const PlateNumber._();

  const factory PlateNumber({
    required String code,
    required String number,
    @Default([]) List<ListingV2> ads,
  }) = _PlateNumber;

  static List<PlateNumber> mockList(int number) {
    return List.generate(
      number,
      (index) => PlateNumber(
        code: (10 + index).toString(),
        number: (1004 + index).toString(),
        ads: [ListingV2.mockAd()],
      ),
    );
  }

  factory PlateNumber.fromJson(Map<String, dynamic> json) => _$PlateNumberFromJson(json);

  factory PlateNumber.fromString(String plateNumber) {
    final parts = plateNumber.split('-');
    return PlateNumber(code: parts[0], number: parts[1]);
  }

// first active listing in the list by createdAt
  ListingV2 get originalListing => ads.firstOrNull ?? ListingV2.mockAd();

  bool get isFeatured => ads.any((ad) => ad.isFeatured);
  bool get isSold => ads.any((ad) => ad.isSold);

  int get adsCount => ads.length;

  @override
  String toString() => '$code-$number';
}
