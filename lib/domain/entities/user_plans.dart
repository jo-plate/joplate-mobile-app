import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_plans.freezed.dart';
part 'user_plans.g.dart';

@freezed
class UserPlans with _$UserPlans {
  const UserPlans._();

  const factory UserPlans({
    @Default(0) int tickets,
    @Default(0) int goldenTickets,
    @Default(PlanType.free_plan) PlanType plan,
  }) = _UserPlans;

  factory UserPlans.fromJson(Map<String, dynamic> json) => _$UserPlansFromJson(json);

  static UserPlans mockPlan() {
    return const UserPlans(
      tickets: 10,
      goldenTickets: 2,
      plan: PlanType.gold_plan,
    );
  }
  static UserPlans freePlan() {
    return const UserPlans(
      tickets: 0,
      goldenTickets: 0,
      plan: PlanType.free_plan,
    );
  }
}

@JsonEnum(alwaysCreate: true)
enum PlanType {
  @JsonValue("free_plan")
  free_plan,
  @JsonValue("gold_plan")
  gold_plan,
  @JsonValue("diamond_plan")
  diamond_plan,
  @JsonValue("admin_plan")
  admin_plan,
}

extension PlanTypeExtension on PlanType {
  String get name {
    switch (this) {
      case PlanType.free_plan:
        return "Basic";
      case PlanType.gold_plan:
        return "Gold";
      case PlanType.diamond_plan:
        return "Diamond 💎";
      case PlanType.admin_plan:
        return "Admin";
    }
  }
}
