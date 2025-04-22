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

  factory UpdateListingDto.fromJson(Map<String, dynamic> json) => _$UpdateListingDtoFromJson(json);

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

@freezed
class UpdateListingDtoV2 with _$UpdateListingDtoV2 {
  const factory UpdateListingDtoV2({
    required String listingId,
    required ItemType itemType,
    int? price,
    int? discountPrice,
  }) = _UpdateListingDtoV2;

  factory UpdateListingDtoV2.fromJson(Map<String, dynamic> json) => _$UpdateListingDtoV2FromJson(json);

  const UpdateListingDtoV2._();

  @override
  Map<String, dynamic> toJson() {
    return super.toJson();
  }
}
