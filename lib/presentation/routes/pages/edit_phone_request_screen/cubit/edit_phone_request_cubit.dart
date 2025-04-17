import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/update_listing_dto.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

part 'edit_phone_request_state.dart';

/// Cubit for editing an existing phone request
class EditPhoneRequestCubit extends Cubit<EditPhoneRequestState> {
  EditPhoneRequestCubit()
      : super(const EditPhoneRequestState(
          requestId: '',
          number: '',
          price: '',
          isSubmitting: false,
          errorMessage: null,
        ));

  /// Load request info into the state
  void loadFromRequest({
    required String requestId,
    required String number,
    required double? price,
  }) {
    emit(state.copyWith(
      requestId: requestId,
      number: number,
      price: price?.toString() ?? '',
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updatePrice(String newPrice) {
    emit(state.copyWith(price: newPrice, errorMessage: null));
  }

  Future<void> submitEdit() async {
    if (state.requestId.isEmpty || state.number.isEmpty) {
      emit(state.copyWith(errorMessage: 'Phone number is required.'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = UpdateListingDto(
      listingId: state.requestId,
      itemType: ItemType.phoneNumber,
      listingType: ListingType.request,
      price: state.price.isNotEmpty ? double.tryParse(state.price) : 0.0,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(updateListingCF);
      final response = await callable.call(dto.toJson());

      if (response.data != null && response.data['success'] == true) {
        emit(state.copyWith(isSubmitting: false));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to update request.',
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
