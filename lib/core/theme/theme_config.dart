import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:upgrade_traine_project/core/common/extensions/extensions.dart';

import '../common/app_colors.dart';
import '../common/app_config.dart';
import '../constants/app/app_constants.dart';

part 'dark/dark_theme.dart';
part 'light/light_theme.dart';

@lazySingleton
class ThemeConfig {
  // final ThemeData _lightTheme = _getLightTheme();
  // final ThemeData _darkTheme = _getDarkTheme();

  ThemeData get lightTheme => _getLightTheme();

  ThemeData get darkTheme => _getDarkTheme();
}
