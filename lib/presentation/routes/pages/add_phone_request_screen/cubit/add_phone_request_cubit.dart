// lib/presentation/routes/pages/add_phone_request_screen/cubit/add_phone_request_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'phone_request_state.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPhoneRequestCubit extends Cubit<PhoneRequestState> {
  AddPhoneRequestCubit() : super(const PhoneRequestState());

  // Update phone number text (required field)
  void updatePhoneNumber(String phoneNumber) {
    emit(state.copyWith(
      phoneNumber: phoneNumber,
      errorMessage: null,
    ));
  }

  // Update price (optional field)
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
      // Convert optional price
      final priceVal = (state.price?.isNotEmpty == true) ? double.tryParse(state.price!) : 0.0;

      final addListingDto = AddListingDto(
        price: priceVal ?? 0.0,
        discountPrice: 0, 
        listingType: ListingType.request,
        itemType: ItemType.phoneNumber,
        isFeatured: false,
        item: {
          "number": state.phoneNumber,
        },
      );

      final callable = FirebaseFunctions.instance.httpsCallable(postRequestCF);
      final response = await callable.call(addListingDto.toJson());

      if (response.data != null && response.data['success'] == true) {
        // success -> reset the form
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
