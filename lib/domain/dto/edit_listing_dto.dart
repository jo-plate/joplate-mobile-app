import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

part 'edit_listing_dto.freezed.dart';
part 'edit_listing_dto.g.dart';

@freezed
class EditListingDto with _$EditListingDto {
  const factory EditListingDto({
    required String listingId,
    required double price,
    double? discountPrice,
    required ItemType itemType,
    bool? priceNegotiable,
    bool? priceHidden,
    bool? isSold,
    bool? isFeatured,
    required Map<String, dynamic> itemData,
  }) = _EditListingDto;

  factory EditListingDto.fromJson(Map<String, dynamic> json) => _$EditListingDtoFromJson(json);
}
