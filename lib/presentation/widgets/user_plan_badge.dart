import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/utils/user_plan_theme.dart';

class UserPlanBadge extends StatelessWidget {
  const UserPlanBadge({
    super.key,
    required this.plan,
    this.size = 16,
    this.showIcon = true,
  });

  final PlanType plan;
  final double size;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final badgeStyle = UserPlanTheme.getPlanBadgeStyle(plan, isDarkMode: isDark);
    final iconVisible = showIcon && badgeStyle.icon != null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: badgeStyle.backgroundColor,
        border: Border.all(color: badgeStyle.borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: badgeStyle.shadowColor,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconVisible) ...[
            Icon(badgeStyle.icon, color: badgeStyle.iconColor, size: size),
            const SizedBox(width: 4),
          ],
          Text(
            plan.name,
            style: TextStyle(
              color: badgeStyle.textColor,
              fontWeight: FontWeight.bold,
              fontSize: size - 3,
            ),
          ),
        ],
      ),
    );
  }
}
