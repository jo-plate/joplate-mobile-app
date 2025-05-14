import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

part 'log_visit_dto.freezed.dart';
part 'log_visit_dto.g.dart';

@freezed
class LogVisitDto with _$LogVisitDto {
  const factory LogVisitDto({
    required String listingId,
    required ListingType listingType,
    required ItemType itemType,
  }) = _LogVisitDto;

  factory LogVisitDto.fromJson(Map<String, dynamic> json) => _$LogVisitDtoFromJson(json);
}
