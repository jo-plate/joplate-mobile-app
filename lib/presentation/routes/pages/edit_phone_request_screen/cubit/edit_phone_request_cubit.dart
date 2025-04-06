// lib/presentation/routes/pages/edit_phone_request_screen/cubit/edit_phone_request_cubit.dart

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/edit_listing_dto.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/data/constants.dart';

part 'edit_phone_request_state.dart';

/// Cubit for editing an existing phone request (code, number, etc.)
class EditPhoneRequestCubit extends Cubit<EditPhoneRequestState> {
  EditPhoneRequestCubit()
      : super(const EditPhoneRequestState(
          requestId: '',
          number: '',
          price: '',
          isSubmitting: false,
          errorMessage: null,
        ));

  /// Load existing phone request data into the state
  void loadRequestData({
    required String requestId,
    required String number,
    double? price,
  }) {
    emit(state.copyWith(
      requestId: requestId,
      number: number,
      price: price?.toString() ?? '',
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  /// Update the phone number text
  void updateNumber(String newNumber) {
    emit(state.copyWith(number: newNumber, errorMessage: null));
  }

  /// Update the optional price
  void updatePrice(String newPrice) {
    emit(state.copyWith(price: newPrice, errorMessage: null));
  }

  /// Submit the edit changes
  Future<void> submitEdit() async {
    if (state.requestId.isEmpty || state.number.isEmpty) {
      emit(state.copyWith(errorMessage: 'Number is required'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    // Build the edit DTO
    final dto = EditListingDto(
      listingId: state.requestId,
      price: double.parse(state.price.isEmpty ? '0' : state.price),
      itemData: PhoneNumber(number: state.number).toJson(),
      itemType: ItemType.phoneNumber,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(updateListingCF);
      final response = await callable.call(dto.toJson());

      if (response.data != null && response.data['success'] == true) {
        // success
        emit(state.copyWith(isSubmitting: false));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to edit phone request',
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
