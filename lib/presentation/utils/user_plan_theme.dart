import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_plans.dart';

class UserPlanTheme {
  static Color getAccentColor(PlanType plan, {bool isDarkMode = false}) {
    switch (plan) {
      case PlanType.gold_plan:
        return const Color(0xFFD4AF37);
      case PlanType.diamond_plan:
        return const Color(0xff3F51B5);
      default:
        return isDarkMode ? Colors.white70 : const Color.fromARGB(255, 153, 31, 22);
    }
  }

  static Color getIconColor(PlanType plan, {required bool isDarkMode}) {
    switch (plan) {
      case PlanType.gold_plan:
        return const Color(0xFFD4AF37);
      case PlanType.diamond_plan:
        // For diamond plan, use a lighter color for better visibility
        return isDarkMode ? Colors.white70 : const Color(0xFF5C6BC0);
      default:
        return isDarkMode ? Colors.white70 : const Color.fromARGB(255, 153, 31, 22);
    }
  }

  static Color getBackgroundColor(PlanType plan, {required bool isDarkMode}) {
    switch (plan) {
      case PlanType.gold_plan:
        return const Color(0xFF2D2A1F);
      case PlanType.diamond_plan:
        return isDarkMode ? const Color(0xFF1E274E) : const Color.fromARGB(68, 85, 90, 255);
      default:
        return isDarkMode ? const Color(0xFF252A41) : const Color.fromARGB(255, 255, 214, 214);
    }
  }

  static Color getTextColor(PlanType plan, {required bool isDarkMode}) {
    switch (plan) {
      case PlanType.gold_plan:
        return const Color(0xFFD4AF37);
      case PlanType.diamond_plan:
        return Colors.white;
      default:
        return isDarkMode ? Colors.white70 : Colors.black;
    }
  }

  static BoxDecoration getSellerContainerStyle(BuildContext context, PlanType plan) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: getBackgroundColor(plan, isDarkMode: isDark),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: isDark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.2),
          blurRadius: 8,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
