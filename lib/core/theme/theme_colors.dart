import 'package:flutter/material.dart';

import '../common/app_config.dart';

class ThemeColors {
  static ThemeColors _instance = ThemeColors._();
  bool isLight = true;

  factory ThemeColors() {
    return _instance;
  }

  ThemeColors._() {
    this.isLight = _isLightTheme;
  }

  /// Adding theme colors getters
  Color get textColor {
    if (isLight) {
      return Colors.black54;
    } else {
      return Colors.white60;
    }
  }

  /// Other logic
  void updateThemeMode() {
    this.isLight = _isLightTheme;
    //notifyListeners();
  }

  bool get _isLightTheme {
    return (AppConfig().themeMode) == ThemeMode.light;
  }
}
