part of 'edit_plate_listing_cubit.dart';

/// State for editing a plate listing
class EditPlateListingState {
  final String listingId;
  final String code;
  final String plateNumber;
  final String price;
  final String? discountPrice;
  final bool withDiscount;
  final bool isFeatured;
  final bool isSubmitting;
  final String? errorMessage;

  const EditPlateListingState({
    required this.listingId,
    required this.code,
    required this.plateNumber,
    required this.price,
    this.discountPrice,
    required this.withDiscount,
    required this.isFeatured,
    required this.isSubmitting,
    this.errorMessage,
  });

  EditPlateListingState copyWith({
    String? listingId,
    String? code,
    String? plateNumber,
    String? price,
    String? discountPrice,
    bool? withDiscount,
    bool? isFeatured,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return EditPlateListingState(
      listingId: listingId ?? this.listingId,
      code: code ?? this.code,
      plateNumber: plateNumber ?? this.plateNumber,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      withDiscount: withDiscount ?? this.withDiscount,
      isFeatured: isFeatured ?? this.isFeatured,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }
}
