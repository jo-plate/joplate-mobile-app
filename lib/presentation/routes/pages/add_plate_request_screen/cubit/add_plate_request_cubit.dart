// lib/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_cubit.dart

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_plate_request_state.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/data/constants.dart';

class AddPlateRequestCubit extends Cubit<PlateRequestState> {
  AddPlateRequestCubit() : super(const PlateRequestState());

  void updateCode(String code) {
    emit(state.copyWith(code: code, errorMessage: null));
  }

  void updateNumber(String number) {
    emit(state.copyWith(number: number, errorMessage: null));
  }

  void updatePrice(String? price) {
    emit(state.copyWith(price: price, errorMessage: null));
  }

  /// Submit the plate request
  Future<void> submitRequest() async {
    // Basic validation
    if (state.code.isEmpty || state.number.isEmpty) {
      emit(state.copyWith(errorMessage: 'Code and Number are required'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    try {
      // Convert optional price
      final priceVal = (state.price?.isNotEmpty == true) ? double.tryParse(state.price!) : 0.0;

      final addListingDto = AddListingDto(
        price: priceVal ?? 0.0,
        discountPrice: 0, // no discount for requests
        listingType: ListingType.request,
        itemType: ItemType.plateNumber,
        priceNegotiable: true,
        priceHidden: false,
        isFeatured: false,
        itemData: {
          "code": state.code,
          "number": state.number,
        },
      );

      final callable = FirebaseFunctions.instance.httpsCallable(postRequestCF);
      final response = await callable.call(addListingDto.toJson());

      if (response.data != null && response.data['success'] == true) {
        // success -> reset the form
        emit(const PlateRequestState());
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to create plate request',
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
