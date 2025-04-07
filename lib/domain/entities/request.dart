import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';

part 'request.freezed.dart';
part 'request.g.dart';

enum ListingType { request, ad }

@Freezed(
  fromJson: true,
  toJson: true,
)
class Request<T> with _$Request {
  Request._();

  factory Request({
    required String id,
    @Default(0) double price,
    required ItemType itemType,
    @Default(false) bool priceHidden,
    @Default(false) bool isSold,
    required String userId,
    PhoneNumber? phoneNumber,
    PlateNumber? plateNumber,
  }) = _Request;

  factory Request.fromJson(Map<String, dynamic> json) => _$RequestFromJson(json);

  static Request<PlateNumber> mockPlateAd() {
    return Request(
      id: "mockPlateId",
      price: 15000.0,
      itemType: ItemType.plateNumber,
      userId: 'mockUser',
      priceHidden: false,
      plateNumber: PlateNumber.mockList(1).first,
    );
  }

  static Request<PhoneNumber> mockPhoneAd() {
    return Request(
        id: "mockPhoneId",
        price: 5000.0,
        itemType: ItemType.phoneNumber,
        priceHidden: false,
        phoneNumber: PhoneNumber.mockList(1).first,
        userId: 'mockUser');
  }

  @override
  Map<String, dynamic> toJson() => toJson();
}
