import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'phone_request_state.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPhoneRequestCubit extends Cubit<PhoneRequestState> {
  AddPhoneRequestCubit() : super(const PhoneRequestState());

  // Update phone number text
  void updatePhoneNumber(String phoneNumber) {
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      errorMessage: null,
    ));
  }

  // Update price (optional)
  void updatePrice(String? price) {
    emit(state.copyWith(
      price: price,
      errorMessage: null,
    ));
  }

  // Submit the request
  Future<void> submitRequest() async {
    // Basic validation: phoneNumber must not be empty
    if (state.phoneNumber.isEmpty) {
      emit(state.copyWith(errorMessage: 'Phone number is required'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      // Build the AddListingDto
      final priceVal = (state.price?.isNotEmpty == true) ? double.tryParse(state.price!) : 0.0;

      final addListingDto = AddListingDto(
        price: priceVal ?? 0.0,
        discountPrice: 0, // no discount field for requests
        listingType: ListingType.request,
        itemType: ItemType.phoneNumber,
        priceNegotiable: true,
        priceHidden: false,
        isFeatured: false,
        itemData: {
          "number": state.phoneNumber,
        },
      );

      final callable = FirebaseFunctions.instance.httpsCallable(createListingCF);
      final response = await callable.call(addListingDto.toJson());

      if (response.data != null && response.data['success'] == true) {
        // success -> reset the form or handle success
        emit(const PhoneRequestState());
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to create phone request',
        ));
      }
    } on FirebaseFunctionsException catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: 'Error: ${e.message}',
      ));
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        errorMessage: e.toString(),
      ));
    }
  }
}
