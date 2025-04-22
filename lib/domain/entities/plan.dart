import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan.freezed.dart';

// SubscriptionPlatform
enum SubscriptionPlatform { ios, android }

extension SubscriptionPlatformExtension on SubscriptionPlatform {
  String get name {
    switch (this) {
      case SubscriptionPlatform.ios:
        return "ios";
      case SubscriptionPlatform.android:
        return "android";
    }
  }

  // fromstring
  static SubscriptionPlatform fromString(String value) {
    switch (value) {
      case "ios":
        return SubscriptionPlatform.ios;
      case "android":
        return SubscriptionPlatform.android;
      default:
        throw Exception("Unknown subscription platform: $value");
    }
  }
}

@freezed
class Plan with _$Plan {
  const Plan._();
  const factory Plan({
    @Default("Plan") String displayName,
    @Default(0) int price,
    @Default([]) List<String> activePerks,
    @Default([]) List<String> disabledPerks,
    @Default(Colors.white) Color color,
    @Default({}) Map<SubscriptionPlatform, String> productIds,
  }) = _Plan;

factory Plan.fromJson(Map<String, dynamic> json) {
  Color color;
  try {
    color = Color(int.parse(json['color'].replaceFirst("#", "0xFF")));
  } catch (e) {
    color = Colors.white;
  }

  final rawProductIds = (json['productIds'] as Map?)?.cast<String, dynamic>() ?? {};

  final productIds = rawProductIds.map(
    (key, value) => MapEntry(
      SubscriptionPlatformExtension.fromString(key),
      value as String,
    ),
  );

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
