import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  Locale locale = const Locale('ar');

  @override
  void onInit() {
    _loadLocale();
    super.onInit();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('languageCode') ?? 'ar';
    locale = Locale(code);
    Get.updateLocale(locale);
    update();
  }

  Future<void> toggleLanguage() async {
    locale = locale.languageCode == 'ar' ? const Locale('en') : const Locale('ar');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);
    Get.updateLocale(locale);
    update();
  }
}
