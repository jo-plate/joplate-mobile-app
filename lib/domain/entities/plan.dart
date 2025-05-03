import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan.freezed.dart';

@freezed
class Plan with _$Plan {
  const Plan._();
  const factory Plan({
    @Default("Plan") String displayName,
    @Default(0) int price,
    @Default([]) List<String> activePerks,
    @Default([]) List<String> disabledPerks,
    @Default(Colors.white) Color color,
    @Default({}) Map<String, String> productIds, // now uses raw strings
  }) = _Plan;

  String get productId {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return productIds["ios"]!;
      case TargetPlatform.android:
        return productIds["android"]!;
      default:
        throw Exception("Unsupported platform: $defaultTargetPlatform");
    }
  }

  factory Plan.fromJson(Map<String, dynamic> json) {
    Color color;
    try {
      color = Color(int.parse(json['color'].replaceFirst("#", "0xFF")));
    } catch (_) {
      color = Colors.white;
    }

    final rawProductIds =
        (json['productIds'] as Map?)?.cast<String, dynamic>() ?? {};
    final productIds = rawProductIds.map((k, v) => MapEntry(k, v as String));

    return Plan(
      displayName: json['displayName'] as String? ?? "Plan",
      price: json['price'] as int? ?? 0,
      activePerks: List<String>.from(json['activePerks'] ?? []),
      disabledPerks: List<String>.from(json['disabledPerks'] ?? []),
      color: color,
      productIds: productIds,
    );
  }
}
