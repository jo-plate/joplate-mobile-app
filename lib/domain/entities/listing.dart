import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/user_profile.dart';

part 'listing.freezed.dart';
part 'listing.g.dart';

enum ListingType { request, ad }

enum ItemType { plateNumber, phoneNumber }

class PhoneOrPlateConverter implements JsonConverter<dynamic, Map<String, dynamic>> {
const PhoneOrPlateConverter();

@override
  dynamic fromJson(Map<String, dynamic> json) {
    switch (json['itemType']) {
      case 'plateNumber':
        return PlateNumber.fromJson(json);
      case 'phoneNumber':
        return PhoneNumber.fromJson(json);
      default:
        throw Exception('Unknown item type');
    }
  }

@override
  Map<String, dynamic> toJson(dynamic object) {
    if (object is PlateNumber) {
      return object.toJson()..addAll({'itemType': 'plateNumber'});
    } else if (object is PhoneNumber) {
      return object.toJson()..addAll({'itemType': 'phoneNumber'});
    } else {
      throw Exception('Unknown item type');
    }
  }
}

@Freezed(
  fromJson: true,
  toJson: true,
)
class Listing<T> with _$Listing {
Listing._();

factory Listing({
    required String id,
    @Default(0) double price,
    double? discountPrice,
    @Default(ListingType.ad) ListingType listingType,
    required ItemType itemType,
    @Default(false) bool priceNegotiable,
    @Default(false) bool priceHidden,
    @Default(false) bool isFeatured,
    @Default(UserProfile()) UserProfile postedBy,
    PhoneNumber? phoneNumber,
    PlateNumber? plateNumber,
  }) = _Listing;

factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

static Listing<PlateNumber> mockPlateAd() {
    return Listing(
        id: "mockPlateId",
        price: 15000.0,
        discountPrice: 14000.0,
        listingType: ListingType.ad,
        itemType: ItemType.plateNumber,
        priceNegotiable: true,
        priceHidden: false,
        isFeatured: true,
        plateNumber: PlateNumber.mockList(1).first,
        postedBy: UserProfile.empty()
            .copyWith(displayName: "mockUser", email: "anasmk9@outlook.com", phonenumber: "+962787940864"));
  }

static Listing<PhoneNumber> mockPhoneAd() {
    return Listing(
        id: "mockPhoneId",
        price: 5000.0,
        discountPrice: 4500.0,
        listingType: ListingType.ad,
        itemType: ItemType.phoneNumber,
        priceNegotiable: true,
        priceHidden: false,
        isFeatured: false,
        phoneNumber: PhoneNumber.mockList(1).first,
        postedBy: UserProfile.empty()
            .copyWith(displayName: "mockUser", email: "anasmk9@outlook.com", phonenumber: "+962787940864"));
  }

Map<String, dynamic> toJson() => toJson();
}
