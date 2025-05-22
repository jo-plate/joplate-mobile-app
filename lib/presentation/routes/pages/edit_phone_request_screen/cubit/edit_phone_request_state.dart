import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_phone_request_state.freezed.dart';

@freezed
class EditPhoneRequestState with _$EditPhoneRequestState {
  const factory EditPhoneRequestState({
    required String requestId,
    required String number,
    @Default('') String description,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _EditPhoneRequestState;
}
