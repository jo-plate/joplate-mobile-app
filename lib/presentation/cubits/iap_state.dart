import 'package:freezed_annotation/freezed_annotation.dart';

part 'iap_state.freezed.dart';

@freezed
class IAPState with _$IAPState {
  const factory IAPState({
    @Default(false) bool isPurchasing,
    String? listingId,
    String? itemType,
  }) = _IAPState;
}
