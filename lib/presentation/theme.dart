import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF981C1E),
    primary: const Color(0xFF981C1E),
    secondary: Colors.black,
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.grey[100],

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black54),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black54),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFF981C1E)),
    ),
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade500,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF981C1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Color(0xFF981C1E), width: 1.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    ),
  ),

  // Button themes
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(const Color(0xFF981C1E)),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      ),
    ),
  ),

  // TabBar theme
  tabBarTheme: const TabBarTheme(
    labelColor: Color(0xFF981C1E),
    unselectedLabelColor: Colors.black,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xFF981C1E), width: 3),
    ),
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),

  // AppBar theme
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[100],
    elevation: 0,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  ),

  // TextButton styles
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF981C1E),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  // switchTheme: SwitchThemeData(
  //   thumbColor: WidgetStateProperty.d(const Color(0xFF981C1E)),
  //   trackColor: WidgetStateProperty.all(Colors.red.shade100),
  //   trackOutlineColor: WidgetStateProperty.all(const Color(0xFF981C1E))
  //   ,

  // ),
);

final cardContainerStyle = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 8,
      spreadRadius: 2,
      offset: const Offset(0, 4),
    ),
  ],
);
