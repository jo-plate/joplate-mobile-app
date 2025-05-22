import 'package:freezed_annotation/freezed_annotation.dart';

part 'plate_form_state.freezed.dart';

/// Each plate form's data and status.
@freezed
class PlateFormState with _$PlateFormState {
  const factory PlateFormState({
    required String code,
    required String number,
    required String price,
    @Default(false) bool withDiscount,
    @Default(false) bool isFeatured,
    @Default(false) bool callForPrice,
    String? discountPrice,
    @Default(false) bool isSubmitting,
    String? errorMessage,
    @Default('') String description,
  }) = _PlateFormState;
}

/// Overall state for the cubit: just a list of [PlateFormState].
@freezed
class AddPlateNumbersState with _$AddPlateNumbersState {
  const factory AddPlateNumbersState({
    required List<PlateFormState> forms,
  }) = _AddPlateNumbersState;
}
