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

@Freezed(fromJson: true, toJson: true)
class Listing<T> with _$Listing {
  const Listing._();

  const factory Listing({
    required String id,
    required double price,
    required double discountPrice,
    required String userId,
    required ListingType listingType,
    required ItemType itemType,
    required bool priceNegotiable,
    required bool priceHidden,
    required bool isFeatured,
    required UserProfile seller,
    PhoneNumber? phoneNumber,
    PlateNumber? plateNumber,
  }) = _Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => _$ListingFromJson(json);

  static Listing<PlateNumber> mockPlateAd() {
    return Listing(
        id: "mockPlateId",
        price: 15000.0,
        discountPrice: 14000.0,
        userId: "mockUserId",
        listingType: ListingType.ad,
        itemType: ItemType.plateNumber,
        priceNegotiable: true,
        priceHidden: false,
        isFeatured: true,
        plateNumber: PlateNumber.mockList(1).first,
        seller: UserProfile.empty()
            .copyWith(displayName: "mockUser", email: "anasmk9@outlook.com", phonenumber: "+962787940864"));
  }

  static Listing<PhoneNumber> mockPhoneAd() {
    return Listing(
        id: "mockPhoneId",
        price: 5000.0,
        discountPrice: 4500.0,
        userId: "mockUserId",
        listingType: ListingType.ad,
        itemType: ItemType.phoneNumber,
        priceNegotiable: true,
        priceHidden: false,
        isFeatured: false,
        phoneNumber: PhoneNumber.mockList(1).first,
        seller: UserProfile.empty()
            .copyWith(displayName: "mockUser", email: "anasmk9@outlook.com", phonenumber: "+962787940864"));
  }
}
