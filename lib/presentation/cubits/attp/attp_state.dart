import 'package:freezed_annotation/freezed_annotation.dart';

part 'attp_state.freezed.dart';

@freezed
class ATPPState with _$ATPPState {
  const factory ATPPState.initial() = _Initial;
  const factory ATPPState.authorized() = _Authorized;
  const factory ATPPState.denied() = _Denied;
  const factory ATPPState.notDetermined() = _NotDetermined;
  const factory ATPPState.restricted() = _Restricted;
  const factory ATPPState.error(String message) = _Error;
}
