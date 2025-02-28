import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/plate_number.dart';

part 'add_listing_dto.freezed.dart';
part 'add_listing_dto.g.dart';

enum ListingType { request, ad }

enum ItemType { plateNumber, phoneNumber }

@freezed
class AddListingDto with _$AddListingDto {
  const factory AddListingDto({
    required double price,
    required double discountPrice,
    required String userId,
    required ListingType listingType,
    required ItemType itemType,
    required bool priceNegotiable,
    required bool priceHidden,
    required bool isFeatured,
    @PhoneOrPlateConverter() required dynamic itemData,
  }) = _AddListingDto;

  factory AddListingDto.fromJson(Map<String, dynamic> json) => _$AddListingDtoFromJson(json);

  static AddListingDto mockAd(ItemType type) {
    return AddListingDto(
      price: 10000.0,
      discountPrice: 9500.0,
      userId: "mockUserId",
      listingType: ListingType.ad,
      itemType: type,
      priceNegotiable: true,
      priceHidden: false,
      isFeatured: true,
      itemData: type == ItemType.phoneNumber ? PhoneNumber.mockList(1).first : PlateNumber.mockList(1).first,
    );
  }
}
