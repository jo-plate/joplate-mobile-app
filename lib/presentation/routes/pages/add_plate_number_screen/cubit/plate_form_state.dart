// lib/presentation/routes/pages/add_plate_number_screen/bloc/plate_form_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plate_form_state.freezed.dart';

/// Each plate form's data and status.
@freezed
class PlateFormState with _$PlateFormState {
  const factory PlateFormState({
    required String code,
    required String number,
    required String price,
    required bool withDiscount,
    String? discountPrice,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _PlateFormState;
}

/// Overall state for the cubit: just a list of [PlateFormState].
@freezed
class AddPlateNumbersState with _$AddPlateNumbersState {
  const factory AddPlateNumbersState({
    required List<PlateFormState> forms,
  }) = _AddPlateNumbersState;
}
