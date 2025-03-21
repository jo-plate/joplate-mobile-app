import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_request_state.freezed.dart';

@freezed
class PhoneRequestState with _$PhoneRequestState {
  const factory PhoneRequestState({
    @Default('') String phoneNumber,
    String? price,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _PhoneRequestState;
}
