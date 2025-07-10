import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

part 'republish_item_dto.freezed.dart';
part 'republish_item_dto.g.dart';

@freezed
class RepublishItemDto with _$RepublishItemDto {
  const RepublishItemDto._();

  const factory RepublishItemDto({
    required String id,
    required ItemType itemType,
    required ListingType listingType,
  }) = _RepublishItemDto;

  factory RepublishItemDto.fromJson(Map<String, dynamic> json) => _$RepublishItemDtoFromJson(json);
}
