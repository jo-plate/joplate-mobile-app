import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_plate_listing_state.freezed.dart';

@freezed
class EditPlateListingState with _$EditPlateListingState {
  const factory EditPlateListingState({
    required String listingId,
    required String code,
    required String plateNumber,
    required String price,
    String? discountPrice,
    required bool isFeatured,
    required bool isDisabled,
    required bool isSold,
    required bool isSubmitting,
    String? errorMessage,
  }) = _EditPlateListingState;
}
