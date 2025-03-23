// lib/presentation/routes/pages/add_plate_request_screen/cubit/add_plate_request_state.dart

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
