import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_plate_request_state.freezed.dart';

@freezed
class EditPlateRequestState with _$EditPlateRequestState {
  const factory EditPlateRequestState({
    required String requestId,
    required String code,
    required String number,
    @Default('') String description,
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _EditPlateRequestState;
}
