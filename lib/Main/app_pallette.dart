import 'package:flutter/material.dart';
import 'package:lagoon_app/Main/user_service.dart';

final appColor = AppPallette();

class AppPallette {
  static final AppPallette instance = AppPallette._internal();
  factory AppPallette() => instance;
  AppPallette._internal();

  bool get _isDark => userService.value.isDarkTheme;

  Color get backgroundColor => _isDark ? Colors.grey[900]! : Colors.grey[100]!;
  Color get backgroundColor2 => _isDark ? const Color(0xFF1E1E1E) : Colors.grey[300]!;
  Color get backgroundColor3 => _isDark ? const Color(0xFF191923) : Colors.white;

  Color get gradiant1 => _isDark ? Colors.blue[500]! : Colors.blue[400]!;
  Color get gradiant2 => _isDark ? Colors.blue[300]! : Colors.blue[600]!;
  Color get gradiant3 => _isDark ? Colors.blue[800]! : Colors.blue[400]!;

  Color get borderColor => _isDark ? Colors.grey[500]! : Colors.grey[700]!;
  Color get borderColor2 => _isDark ? Colors.grey[700]! : Colors.grey[500]!;
  Color get borderColor3 => _isDark ? Colors.grey[600]! : Colors.grey[600]!;
  Color get borderColor4 => _isDark ? Colors.grey[800]! : Colors.grey[600]!;
  Color get borderColor5 => _isDark ? Colors.grey[850]! : Colors.grey[400]!;

  Color get textColor1 => _isDark ? Colors.grey[100]! : Colors.grey[900]!;
  Color get textColor2 => _isDark ? Colors.grey[200]! : Colors.grey[800]!;
  Color get textColor3 => _isDark ? Colors.grey[400]! : Colors.grey[700]!;

  Color get transparentColor => Colors.transparent;

  Color get errorColor => Colors.red[600]!;
  Color get errorColor2 => Colors.red[400]!;
}