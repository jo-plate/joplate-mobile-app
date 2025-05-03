import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_plan.freezed.dart';
part 'ticket_plan.g.dart';

@freezed
class TicketPlan with _$TicketPlan {
  const TicketPlan._();
  const factory TicketPlan({
    required int amount,
    required double price,
    required Map<String, String> productIds,
    required String title,
    required String titleAr,
  }) = _TicketPlan;

  factory TicketPlan.fromJson(Map<String, dynamic> json) =>
      _$TicketPlanFromJson(json);

  String? get productId {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return productIds['ios'];
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return productIds['android'];
    }
    return null;
  }
}
