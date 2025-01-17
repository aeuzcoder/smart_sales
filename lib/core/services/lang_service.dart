import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_sale_boss/data/datasources/database/db_service.dart';

import '../locals/ru_ru.dart';
import '../locals/uz_uz.dart';

class LangService extends Translations {
  // Default locale
  static final locale = defLanguage(DBService.to.getLanguage());

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('ru', 'RU');

  static final langs = [
    'ru',
    'uz',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('ru', 'RU'),
    const Locale('uz', 'UZ'),
  ];

  static final flags = [
    "assets/images/im_flag_uzb.png",
    "assets/images/im_flag_russia.png",
  ];

  static Locale defLanguage(String code) {
    var index = langs.indexOf(code);
    return locales[index];
  }

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
    'ru_RU': ruRU, // lang/ru_ru.dart
    'uz_UZ': uzUZ, // lang/uz_uz.dart
  };

  // Gets locale from language, and updates the locale
  static void changeLocale(String lang) async {
    final locale = _getLocaleFromLanguage(lang);
    if (locale != null) {
      Get.updateLocale(locale);
      DBService.to.setLanguage(lang);
    }
  }

  // Finds language in `langs` list and returns it as Locale
  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.deviceLocale;
  }
}