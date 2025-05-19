import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_plans.dart';

class PlanBadgeStyle {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final Color shadowColor;
  final IconData? icon;

  const PlanBadgeStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
    required this.shadowColor,
    this.icon,
  });
}

class UserPlanTheme {
  static Color getAccentColor(PlanType plan, {bool isDarkMode = false}) {
    switch (plan) {
      case PlanType.gold_plan:
        return isDarkMode ? const Color(0xFFDAA520) : const Color(0xFF403301);
      case PlanType.diamond_plan:
        return const Color(0xff3F51B5);
      default:
        return isDarkMode ? Colors.white70 : const Color.fromARGB(255, 153, 31, 22);
    }
  }

  static Color getIconColor(PlanType plan, {required bool isDarkMode}) {
    switch (plan) {
      case PlanType.gold_plan:
        return isDarkMode ? const Color(0xFFDAA520) : const Color(0xFF403301);
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
        return isDarkMode ? const Color(0xFF2D2A1F) : const Color.fromARGB(255, 255, 227, 116);
      case PlanType.diamond_plan:
        return true ? const Color(0xFF1E274E) : const Color(0xFF87ceeb);
      default:
        return isDarkMode ? const Color(0xFF252A41) : const Color.fromARGB(255, 255, 214, 214);
    }
  }

  static Color getTextColor(PlanType plan, {required bool isDarkMode}) {
    switch (plan) {
      case PlanType.gold_plan:
        return isDarkMode ? const Color(0xFFDAA520) : const Color(0xFF403301);
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

  static PlanBadgeStyle getPlanBadgeStyle(PlanType plan, {required bool isDarkMode}) {
    switch (plan) {
      case PlanType.diamond_plan:
        return PlanBadgeStyle(
          backgroundColor: const Color(0xFF3F51B5),
          borderColor: const Color(0xFF5C6BC0),
          textColor: Colors.white,
          iconColor: Colors.white,
          shadowColor: const Color(0xFF3F51B5).withOpacity(0.3),
        );
      case PlanType.gold_plan:
        final goldColor = isDarkMode ? const Color(0xFFDAA520) : const Color(0xFFD4AF37);
        return PlanBadgeStyle(
          backgroundColor: isDarkMode ? goldColor.withOpacity(0.15) : const Color(0xFFFFF8DC),
          borderColor: goldColor,
          textColor: goldColor,
          iconColor: goldColor,
          shadowColor: goldColor.withOpacity(0.3),
          icon: Icons.workspace_premium,
        );
      default:
        const bronzeColor = Color(0xFFCD7F32);
        return PlanBadgeStyle(
          backgroundColor: isDarkMode ? bronzeColor.withOpacity(0.15) : bronzeColor.withOpacity(0.1),
          borderColor: bronzeColor,
          textColor: bronzeColor,
          iconColor: bronzeColor,
          shadowColor: bronzeColor.withOpacity(0.3),
          icon: Icons.account_circle,
        );
    }
  }
}
