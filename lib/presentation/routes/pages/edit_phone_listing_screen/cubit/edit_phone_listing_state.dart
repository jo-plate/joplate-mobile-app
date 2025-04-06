part of 'edit_phone_listing_cubit.dart';

/// State for editing a phone listing
class EditPhoneListingState {
  final String listingId;
  final String number;
  final String price;
  final String? discountPrice;
  final bool withDiscount;
  final bool isFeatured;
  final bool isSubmitting;
  final String? errorMessage;

  const EditPhoneListingState({
    required this.listingId,
    required this.number,
    required this.price,
    this.discountPrice,
    required this.withDiscount,
    required this.isFeatured,
    required this.isSubmitting,
    this.errorMessage,
  });

  EditPhoneListingState copyWith({
    String? listingId,
    String? number,
    String? price,
    String? discountPrice,
    bool? withDiscount,
    bool? isFeatured,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return EditPhoneListingState(
      listingId: listingId ?? this.listingId,
      number: number ?? this.number,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      withDiscount: withDiscount ?? this.withDiscount,
      isFeatured: isFeatured ?? this.isFeatured,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }
}
