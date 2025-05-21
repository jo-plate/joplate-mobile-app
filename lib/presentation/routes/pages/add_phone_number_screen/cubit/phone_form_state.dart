// lib/presentation/routes/pages/add_phone_number_screen/bloc/phone_form_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_form_state.freezed.dart';

/// Each phone form's data and status.
@freezed
class PhoneFormState with _$PhoneFormState {
  const factory PhoneFormState({
    required String number,
    required String price,
    required bool withDiscount,
    String? discountPrice,
    required bool isFeatured,
    @Default(false) bool callForPrice,
    @Default(false) bool isSubmitting,
    String? errorMessage,
    @Default('') String description,
  }) = _PhoneFormState;
}

/// Overall state for the cubit: just a list of [PhoneFormState].
@freezed
class AddPhoneNumbersState with _$AddPhoneNumbersState {
  const factory AddPhoneNumbersState({
    required List<PhoneFormState> forms,
  }) = _AddPhoneNumbersState;
}
