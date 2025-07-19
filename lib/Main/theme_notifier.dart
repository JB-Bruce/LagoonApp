import 'dart:developer';

import 'package:flutter/material.dart';
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
    return ThemeNotifier(isDark);
  }

  void toggle() async {
    value = !value;
    userService.value.isDarkTheme = value;
    log(value.toString());
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then(
            (pref)
        {
          pref.setBool(_key, value);
        }
    );
    log(value.toString());
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