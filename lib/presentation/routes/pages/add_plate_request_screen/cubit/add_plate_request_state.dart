import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_plate_request_state.freezed.dart';

@freezed
class PlateRequestState with _$PlateRequestState {
  const factory PlateRequestState({
    @Default('') String code,
    @Default('') String number,
    String? price, // optional
    @Default(false) bool isSubmitting,
    String? errorMessage,
  }) = _PlateRequestState;
}
