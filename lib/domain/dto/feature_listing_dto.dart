import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_listing_dto.freezed.dart';
part 'feature_listing_dto.g.dart';

@freezed
class FeatureListingDto with _$FeatureListingDto {
  const factory FeatureListingDto({
    required String listingId,
    required String itemType,
    bool? goldenTicket,
    IAPData? iapData,
  }) = _FeatureListingDto;

  factory FeatureListingDto.fromJson(Map<String, dynamic> json) => _$FeatureListingDtoFromJson(json);
}

@freezed
class IAPData with _$IAPData {
  const factory IAPData({
    required String productId,
    required String transactionId,
    required String purchaseToken,
    String? receipt, // iOS-specific
  }) = _IAPData;

  factory IAPData.fromJson(Map<String, dynamic> json) => _$IAPDataFromJson(json);
}
