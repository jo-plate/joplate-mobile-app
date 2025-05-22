import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_phone_listing_state.freezed.dart';

@freezed
class EditPhoneListingState with _$EditPhoneListingState {
  const factory EditPhoneListingState({
    required String listingId,
    required String number,
    required String price,
    String? discountPrice,
    String? description,
    required bool withDiscount,
    required bool isFeatured,
    required bool isDisabled,
    required bool isSold,
    @Default(false) bool priceHidden,
    required bool isSubmitting,
    String? errorMessage,
  }) = _EditPhoneListingState;
}
