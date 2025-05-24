import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/user_plans.dart';

part 'plan.freezed.dart';

@freezed
class Plan with _$Plan {
  const Plan._();
  const factory Plan({
    @Default("Plan") String displayName,
    @Default(0) double price,
    @Default([]) List<String> activePerks,
    @Default([]) List<String> disabledPerks,
    @Default(Colors.white) Color color,
    @Default({}) Map<String, String> productIds,
    @Default([]) List<String> activePerksAr,
    @Default([]) List<String> disabledPerksAr,
    @Default(PlanType.free_plan) PlanType planType,
  }) = _Plan;

  String get productId {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return productIds["android"] ?? "";
      case TargetPlatform.iOS:
        return productIds["ios"] ?? "";
      default:
        return productIds["ios"] ?? "";
    }
  }

  factory Plan.fromJson(Map<String, dynamic> json) {
    Color color;
    try {
      color = Color(int.parse(json['color'].replaceFirst("#", "0xFF")));
    } catch (_) {
      color = Colors.white;
    }

    final rawProductIds = (json['productIds'] as Map?)?.cast<String, dynamic>() ?? {};
    final productIds = rawProductIds.map((k, v) => MapEntry(k, v as String));

    return Plan(
      displayName: json['displayName'] as String? ?? "Plan",
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      activePerks: List<String>.from(json['activePerks'] ?? []),
      disabledPerks: List<String>.from(json['disabledPerks'] ?? []),
      activePerksAr: List<String>.from(json['activePerksAr'] ?? []),
      disabledPerksAr: List<String>.from(json['disabledPerksAr'] ?? []),
      color: color,
      productIds: productIds,
    );
  }
}
