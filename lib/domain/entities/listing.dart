import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/phone_number.dart';
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

class ItemTypeConverter implements JsonConverter<dynamic, Map<String, dynamic>> {
  const ItemTypeConverter();

  @override
  dynamic fromJson(Map<String, dynamic> json) {
    if (json['itemType'] == ItemType.plateNumber.toString()) {
      return PlateNumber.fromJson(json); // For PlateNumber type
    } else if (json['itemType'] == ItemType.phoneNumber.toString()) {
      return PhoneNumber.fromJson(json); // For PhoneNumber type
    } else {
      throw Exception('Unknown item type');
    }
  }

  @override
  Map<String, dynamic> toJson(dynamic object) {
    if (object is PlateNumber) {
      return object.toJson(); // Convert PlateNumber object to JSON
    } else if (object is PhoneNumber) {
      return object.toJson(); // Convert PhoneNumber object to JSON
    } else {
      throw Exception('Unknown item type');
    }
  }
}

@Freezed(fromJson: true, toJson: true, genericArgumentFactories: true)
class Listing<T> with _$Listing {
  const Listing._();

  const factory Listing({
    @ItemTypeConverter() required T item,
    required ItemType itemType,
    required ListingType listingType,
    required double price,
    double? discountPrice,
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
        price: 10000.0 + index,
      ),
    );
  }

  static List<Listing<PhoneNumber>> mockPhoneNumberList(int number) {
    return List.generate(
      number,
      (index) => Listing(
        item: PhoneNumber.mockList(1).first,
        listingType: ListingType.ad,
        itemType: ItemType.phoneNumber,
        price: 10000.0 + index,
      ),
    );
  }

  factory Listing.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ListingFromJson(json, fromJsonT);
}
