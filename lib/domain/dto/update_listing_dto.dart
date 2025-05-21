import 'package:freezed_annotation/freezed_annotation.dart';
import 'add_listing_dto.dart';

part 'update_listing_dto.freezed.dart';
part 'update_listing_dto.g.dart';

@freezed
class UpdateListingDtoV2 with _$UpdateListingDtoV2 {
  const factory UpdateListingDtoV2({
    required String listingId,
    required ItemType itemType,
    int? price,
    int? discountPrice,
    String? description,
  }) = _UpdateListingDtoV2;

  factory UpdateListingDtoV2.fromJson(Map<String, dynamic> json) =>
      _$UpdateListingDtoV2FromJson(json);

  const UpdateListingDtoV2._();

}
