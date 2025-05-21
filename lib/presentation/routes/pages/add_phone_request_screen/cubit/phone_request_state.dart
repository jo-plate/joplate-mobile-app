// lib/presentation/routes/pages/add_phone_request_screen/bloc/phone_request_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_request_state.freezed.dart';

@freezed
class PhoneRequestState with _$PhoneRequestState {
  const factory PhoneRequestState({
    @Default('') String phoneNumber, // required field
    String? price, // optional
    @Default(false) bool isSubmitting,
    String? errorMessage,
    @Default('') String description,
  }) = _PhoneRequestState;
}
