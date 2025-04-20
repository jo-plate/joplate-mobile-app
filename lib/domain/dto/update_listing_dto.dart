import 'package:freezed_annotation/freezed_annotation.dart';
import 'add_listing_dto.dart';

part 'update_listing_dto.freezed.dart';
part 'update_listing_dto.g.dart';

@freezed
class UpdateListingDto with _$UpdateListingDto {
  const factory UpdateListingDto({
    required String listingId,
    required ItemType itemType,
    required ListingType listingType,
    int? price,
    int? discountPrice,
    bool? isFeatured,
    bool? isDisabled,
    bool? isSold,
  }) = _UpdateListingDto;

  factory UpdateListingDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateListingDtoFromJson(json);

  const UpdateListingDto._();

  @override
  Map<String, dynamic> toJson() {
    return {
      'listingId': listingId,
      'itemType': itemType.name,
      'listingType': listingType.name,
      'price': price,
      'discountPrice': discountPrice,
      'isFeatured': isFeatured,
      'isDisabled': isDisabled,
      'isSold': isSold,
    };
  }
}
