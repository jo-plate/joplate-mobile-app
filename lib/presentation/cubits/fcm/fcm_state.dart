import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_state.freezed.dart';

@freezed
class FCMState with _$FCMState {
  const factory FCMState.initial() = _Initial;
  const factory FCMState.initialized() = _Initialized;
  const factory FCMState.error(String message) = _Error;
}
