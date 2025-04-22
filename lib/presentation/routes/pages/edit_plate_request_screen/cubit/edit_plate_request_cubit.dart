import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/update_request_dto.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/routes/pages/edit_plate_request_screen/cubit/edit_plate_request_state.dart';

class EditPlateRequestCubit extends Cubit<EditPlateRequestState> {
  EditPlateRequestCubit()
      : super(const EditPlateRequestState(
          requestId: '',
          code: '',
          number: '',
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
      isSubmitting: false,
      errorMessage: null,
    ));
  }

  void updateCode(String code) {
    emit(state.copyWith(
      code: code,
      errorMessage: null,
    ));
  }

  void updateNumber(String number) {
    emit(state.copyWith(
      number: number,
      errorMessage: null,
    ));
  }

  Future<void> submitEdit() async {
    if (state.requestId.isEmpty || state.code.isEmpty || state.number.isEmpty) {
      emit(state.copyWith(errorMessage: 'Code and Number are required'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = UpdateRequestDto(
      id: state.requestId,
      itemType: ItemType.plateNumber,
      data: PlateNumber(code: state.code, number: state.number).toJson(),
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(updateListingCF);
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
