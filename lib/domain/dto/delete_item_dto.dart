import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

part 'delete_item_dto.freezed.dart';
part 'delete_item_dto.g.dart';

@freezed
class DeleteItemDto with _$DeleteItemDto {
  const DeleteItemDto._();

  const factory DeleteItemDto({
    required String id,
    required ItemType itemType,
    required ListingType listingType,
    @Default(false) bool isSold,
  }) = _DeleteItemDto;

  factory DeleteItemDto.fromJson(Map<String, dynamic> json) => _$DeleteItemDtoFromJson(json);
}
