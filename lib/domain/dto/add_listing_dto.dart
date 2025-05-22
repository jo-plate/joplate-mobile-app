import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_listing_dto.freezed.dart';
part 'add_listing_dto.g.dart';

@JsonEnum(alwaysCreate: true)
enum ItemType {
  @JsonValue("plateNumber")
  plateNumber,

  @JsonValue("phoneNumber")
  phoneNumber,
}

@JsonEnum(alwaysCreate: true)
enum ListingType {
  @JsonValue("request")
  request,

  @JsonValue("ad")
  ad,
}

extension ItemTypeX on ItemType {
  String toJson() => _$ItemTypeEnumMap[this]!;
  static ItemType fromJson(String json) => _$ItemTypeEnumMap.entries.firstWhere((e) => e.value == json).key;
}

@freezed
class AddListingDto with _$AddListingDto {
  const factory AddListingDto({
    required int price,
    required int discountPrice,
    required ListingType listingType,
    required ItemType itemType,
    required bool isFeatured,
    required Map<String, dynamic> item,
    String? description,
  }) = _AddListingDto;

  factory AddListingDto.fromJson(Map<String, dynamic> json) => _$AddListingDtoFromJson(json);
}
