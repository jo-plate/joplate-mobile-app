import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/update_listing_dto.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';

part 'edit_phone_listing_state.dart';

class EditPhoneListingCubit extends Cubit<EditPhoneListingState> {
  EditPhoneListingCubit()
      : super(const EditPhoneListingState(
          listingId: '',
          number: '',
          price: '',
          discountPrice: null,
          withDiscount: false,
          isFeatured: false,
          isDisabled: false,
          isSold: false,
          isSubmitting: false,
          errorMessage: null,
        ));

  void loadListing(PhoneListing listing) {
    emit(EditPhoneListingState(
      listingId: listing.id,
      number: listing.item.number,
      price: listing.price.toString(),
      withDiscount: listing.discountPrice != 0,
      discountPrice: listing.discountPrice.toString(),
      isFeatured: listing.isFeatured,
      isDisabled: listing.isDisabled,
      isSold: listing.isSold,
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updatePrice(String newPrice) {
    emit(state.copyWith(price: newPrice, errorMessage: null));
  }

  void updateDiscountPrice(String newDiscount) {
    emit(state.copyWith(discountPrice: newDiscount, errorMessage: null));
  }

  void toggleFeatured(bool enable) {
    emit(state.copyWith(isFeatured: enable, errorMessage: null));
  }

  void toggleDiscount(bool enable) {
    emit(state.copyWith(
      withDiscount: enable,
      discountPrice: enable ? state.discountPrice : null,
      errorMessage: null,
    ));
  }

  void toggleDisabled(bool enable) {
    emit(state.copyWith(isDisabled: enable, errorMessage: null));
  }

  void toggleSold(bool enable) {
    emit(state.copyWith(isSold: enable, errorMessage: null));
  }

  Future<void> submitEdit() async {
    if (state.listingId.isEmpty || state.price.isEmpty) {
      emit(state.copyWith(errorMessage: 'Please fill all required fields.'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = UpdateListingDto(
      listingId: state.listingId,
      itemType: ItemType.phoneNumber,
      listingType: ListingType.ad,
      price: double.tryParse(state.price),
      discountPrice: state.discountPrice?.isNotEmpty == true
          ? double.tryParse(state.discountPrice!)
          : null,
      isFeatured: state.isFeatured,
      isDisabled: state.isDisabled,
      isSold: state.isSold,
    );

    try {
      final callable =
          FirebaseFunctions.instance.httpsCallable(updateListingCF);
      final response = await callable.call(dto.toJson());

      if (response.data?['success'] == true) {
        emit(state.copyWith(isSubmitting: false));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to update listing.',
        ));
      }
    } on FirebaseFunctionsException catch (e) {
      emit(state.copyWith(
          isSubmitting: false, errorMessage: 'Error: ${e.message}'));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
    }
  }
}
