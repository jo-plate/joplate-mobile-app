import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

part 'update_request_dto.freezed.dart';
part 'update_request_dto.g.dart';

@freezed
class UpdateRequestDto with _$UpdateRequestDto {
  const UpdateRequestDto._();

  const factory UpdateRequestDto({
    required String id,
    required ItemType itemType,
    required Map<String, dynamic> data,
  }) = _UpdateRequestDto;

  factory UpdateRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateRequestDtoFromJson(json);
}
