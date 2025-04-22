import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/update_listing_dto.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/dto/update_request_dto.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/routes/pages/edit_phone_request_screen/cubit/edit_phone_request_state.dart';

class EditPhoneRequestCubit extends Cubit<EditPhoneRequestState> {
  EditPhoneRequestCubit()
      : super(const EditPhoneRequestState(
          requestId: '',
          isSubmitting: false,
          errorMessage: null,
          number: '',
        ));

  /// Load request info into the state
  void loadFromRequest({
    required PhoneRequest request,
  }) {
    emit(state.copyWith(
      requestId: request.id,
      number: request.item.number.toString(),
      isSubmitting: false,
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
    if (state.requestId.isEmpty) {
      emit(state.copyWith(errorMessage: 'Phone number is required.'));
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: null));

    final dto = UpdateRequestDto(
      id: state.requestId,
      itemType: ItemType.phoneNumber,
      data: PhoneNumber(number: state.number).toJson(),
    );

    try {
      final callable =
          FirebaseFunctions.instance.httpsCallable(updateRequestCF);
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
