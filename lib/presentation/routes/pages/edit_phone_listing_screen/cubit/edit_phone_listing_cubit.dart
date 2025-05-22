import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/update_listing_dto.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'edit_phone_listing_state.dart';

class EditPhoneListingCubit extends Cubit<EditPhoneListingState> {
  EditPhoneListingCubit()
      : super(const EditPhoneListingState(
          listingId: '',
          number: '',
          price: '',
          discountPrice: null,
          description: null,
          withDiscount: false,
          isFeatured: false,
          isDisabled: false,
          isSold: false,
          priceHidden: false,
          isSubmitting: false,
          errorMessage: null,
        ));

  void loadListing(PhoneListing listing) {
    emit(EditPhoneListingState(
      listingId: listing.id,
      number: listing.item.number,
      price: listing.price.toString(),
      withDiscount: listing.discountPrice != 0 && !listing.priceHidden,
      discountPrice: listing.discountPrice.toString(),
      description: listing.description,
      isFeatured: listing.isFeatured,
      isDisabled: listing.isDisabled,
      isSold: listing.isSold,
      priceHidden: listing.priceHidden,
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updatePrice(String newPrice) {
    emit(state.copyWith(price: newPrice, errorMessage: null));
  }

  void updatePriceHidden(bool hidden) {
    emit(state.copyWith(priceHidden: hidden, errorMessage: null));
  }

  void updateDiscountPrice(String newDiscount) {
    emit(state.copyWith(discountPrice: newDiscount, errorMessage: null));
  }

  void updateDescription(String description) {
    emit(state.copyWith(description: description, errorMessage: null));
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

  Future<void> submitEdit() async {
    if (state.listingId.isEmpty || (!state.priceHidden && state.price.isEmpty)) {
      emit(state.copyWith(errorMessage: 'Please fill all required fields.'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = UpdateListingDtoV2(
      listingId: state.listingId,
      itemType: ItemType.phoneNumber,
      price: state.priceHidden ? 0 : int.tryParse(state.price),
      discountPrice: state.discountPrice?.isNotEmpty == true ? int.tryParse(state.discountPrice!) : null,
      description: state.description,
      priceHidden: state.priceHidden,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(updateListingCF);
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
      print(e);
      emit(state.copyWith(isSubmitting: false, errorMessage: 'Error: ${e.message}'));
    } catch (e) {
      print(e);
      emit(state.copyWith(isSubmitting: false, errorMessage: e.toString()));
    }
  }
}
