import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Events
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class LoadTheme extends ThemeEvent {}

// State
class ThemeState {
  final ThemeMode themeMode;
  final bool isDarkMode;

  ThemeState({
    required this.themeMode,
    required this.isDarkMode,
  });

  ThemeState copyWith({
    ThemeMode? themeMode,
    bool? isDarkMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}

@singleton
class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences _prefs;
  static const String _themeKey = 'theme_mode';

  ThemeCubit(this._prefs)
      : super(ThemeState(
          themeMode: ThemeMode.light,
          isDarkMode: false,
        ));

  Future<void> toggleTheme() async {
    final newMode = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    await _prefs.setString(_themeKey, newMode.toString());
    emit(state.copyWith(
      themeMode: newMode,
      isDarkMode: newMode == ThemeMode.dark,
    ));
  }

  Future<void> loadTheme() async {
    final savedTheme = _prefs.getString(_themeKey);
    if (savedTheme != null) {
      final themeMode = ThemeMode.values.firstWhere(
        (mode) => mode.toString() == savedTheme,
        orElse: () => ThemeMode.light,
      );

      emit(state.copyWith(
        themeMode: themeMode,
        isDarkMode: themeMode == ThemeMode.dark,
      ));
    } else {
      // If no theme was previously set, use light theme
      await _prefs.setString(_themeKey, ThemeMode.light.toString());
      emit(state.copyWith(
        themeMode: ThemeMode.light,
        isDarkMode: false,
      ));
    }
  }
}
