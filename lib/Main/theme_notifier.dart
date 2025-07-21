import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_service.dart';

class ThemeNotifier extends ValueNotifier<bool> {
  static const _key = 'isDarkTheme';

  ThemeNotifier(bool isDark) : super(isDark);

  static Future<ThemeNotifier> init() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool(_key);

    isDark ??= true;

    userService.value.isDarkTheme = isDark;

    setPhoneIconsBrightness(isDark);

    return ThemeNotifier(isDark);
  }

  void toggle() async {
    value = !value;
    userService.value.isDarkTheme = value;
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then(
            (pref)
        {
          pref.setBool(_key, value);
        }
    );

    setPhoneIconsBrightness(value);

  }

  static void setPhoneIconsBrightness(bool value){
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // ou ta couleur de fond
        statusBarIconBrightness: value ? Brightness.light : Brightness.dark,
        statusBarBrightness: value ? Brightness.dark : Brightness.light, // Pour iOS
      ),
    );
  }

  void set(bool newValue) async {
    value = newValue;
    userService.value.isDarkTheme = newValue;
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then(
            (pref)
        {
          pref.setBool(_key, newValue);
        }
    );
  }
}

late final ThemeNotifier themeNotifier;