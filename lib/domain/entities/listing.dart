// extract parent class from thhe commented code below
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/plate_number.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

enum ListingType {
  request,
  ad,
}

enum ItemType {
  plateNumber,
  phoneNumber,
}

@Freezed(genericArgumentFactories: true, fromJson: true, toJson: true)
class Listing<T> with _$Listing {
  const Listing._();

  const factory Listing({
    required T item,
    required ItemType itemType,
    required ListingType listingType,
    required String price,
    @Default('') String userId,
    @Default('') String description,
    @Default(false) bool priceNegotiable,
    @Default(false) priceHidden,
  }) = _Listing;

  static List<Listing<PlateNumber>> mockPlateNumberList(int number) {
    return List.generate(
      number,
      (index) => Listing(
        item: PlateNumber.mockList(1).first,
        listingType: ListingType.ad,
        itemType: ItemType.plateNumber,
        price: (10000 + index).toString(),
      ),
    );
  }

  // generic fromJson
  factory Listing.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return _$ListingFromJson(json, fromJsonT);
  }
}
