import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocalizationCubit extends Cubit<Locale> {
  final SharedPreferences _prefs;
  static const String _languageKey = 'app_language';

  LocalizationCubit(this._prefs) : super(const Locale('ar')); // default to Arabic

  void setLocale(Locale locale) {
    // Save the language preference
    _prefs.setString(_languageKey, locale.languageCode);
    emit(locale);
  }

  Future<void> loadLanguage() async {
    final savedLanguage = _prefs.getString(_languageKey);
    if (savedLanguage != null) {
      final locale = Locale(savedLanguage);
      emit(locale);
    } else {
      // If no language was previously set, use Arabic as default and save it
      await _prefs.setString(_languageKey, 'ar');
      emit(const Locale('ar'));
    }
  }
}
