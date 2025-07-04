import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(const Locale('ar')); // default to English

  void setLocale(Locale locale) => emit(locale);
}
