import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/update_listing_dto.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/request.dart';

part 'edit_plate_request_state.dart';

class EditPlateRequestCubit extends Cubit<EditPlateRequestState> {
  EditPlateRequestCubit()
      : super(const EditPlateRequestState(
          requestId: '',
          code: '',
          number: '',
          price: '',
          isSubmitting: false,
          errorMessage: null,
        ));

  void loadRequestData({
    required PlateRequest request,
  }) {
    emit(state.copyWith(
      requestId: request.id,
      code: request.item.code,
      number: request.item.number,
      price: request.price.toString(),
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updatePrice(String newPrice) {
    emit(state.copyWith(price: newPrice, errorMessage: null));
  }

  Future<void> submitEdit() async {
    if (state.requestId.isEmpty || state.code.isEmpty || state.number.isEmpty) {
      emit(state.copyWith(errorMessage: 'Code and Number are required'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = UpdateListingDto(
      listingId: state.requestId,
      itemType: ItemType.plateNumber,
      listingType: ListingType.request,
      price: double.tryParse(state.price) ?? 0,
    );

    try {
      final callable =
          FirebaseFunctions.instance.httpsCallable(updateListingCF);
      final response = await callable.call(dto.toJson());

      if (response.data != null && response.data['success'] == true) {
        emit(state.copyWith(isSubmitting: false));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          errorMessage: 'Failed to edit plate request',
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
