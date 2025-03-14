import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_plans.freezed.dart';
part 'user_plans.g.dart';

@freezed
class UserPlans with _$UserPlans {
  const UserPlans._();

  const factory UserPlans({
    @Default(0) int tickets,
    @Default(0) int goldenTickets,
    @Default("free_plan") String plan,
  }) = _UserPlans;

  factory UserPlans.fromJson(Map<String, dynamic> json) => _$UserPlansFromJson(json);

  static UserPlans mockPlan() {
    return const UserPlans(
      tickets: 10,
      goldenTickets: 2,
      plan: "diamond_plan",
    );
  }
}
