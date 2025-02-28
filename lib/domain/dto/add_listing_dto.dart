import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/listing.dart';

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
}

@freezed
class UpdateListingDto with _$UpdateListingDto {
  const factory UpdateListingDto({
    required String listingId,
    double? price,
    double? discountPrice,
    bool? priceNegotiable,
    bool? priceHidden,
    bool? isFeatured,
  }) = _UpdateListingDto;

  factory UpdateListingDto.fromJson(Map<String, dynamic> json) => _$UpdateListingDtoFromJson(json);
}

@freezed
class DeleteListingDto with _$DeleteListingDto {
  const factory DeleteListingDto({
    required String listingId,
    required bool disabled,
  }) = _DeleteListingDto;

  factory DeleteListingDto.fromJson(Map<String, dynamic> json) => _$DeleteListingDtoFromJson(json);
}

