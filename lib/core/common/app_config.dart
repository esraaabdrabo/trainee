import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:package_info/package_info.dart';

import '../../di/service_locator.dart';
import '../constants/app/app_constants.dart';
import '../constants/enums/app_theme_enum.dart';
import '../constants/enums/system_type.dart';
import '../datasources/shared_preference.dart';
import '../theme/theme_config.dart';
import 'app_options/app_options.dart';

/// This class it contain multiple core functions
/// for get device info
/// for get and set language
/// for current app theme
/// for options in application
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();

  String? _appLanguage;
  final String apiKey = "";
  SystemType? _os;
  String? _currentVersion;
  String? _buildNumber;
  String? _appName;
  String? _appVersion;
  AppThemes _appTheme = AppThemes.LIGHT;
  AppOptions _appOptions = AppOptions();

  SystemType? get os => _os;

  String? get currentVersion => _currentVersion;

  String? get buildNumber => _buildNumber;

  String? get appVersion => _appVersion;

  String? get appName => _appName;

  AppOptions get appOptions => _appOptions;

  ThemeData get themeData => _appTheme == AppThemes.LIGHT
      ? getIt<ThemeConfig>().lightTheme
      : getIt<ThemeConfig>().darkTheme;

  ThemeMode get themeMode =>
      _appTheme == AppThemes.LIGHT ? ThemeMode.light : ThemeMode.dark;

  initApp() async {
    /// get OS
    if (Platform.isIOS) {
      _os = SystemType.IOS;
    }
    if (Platform.isAndroid) {
      _os = SystemType.Android;
    }

    /// get version
    final packageInfo = await PackageInfo.fromPlatform();
    _currentVersion = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    _appName = packageInfo.appName;

    /// Get Initital App Theme
    _appTheme = await _getAppTheme;
  }

  /// deleteToken
  Future<void> deleteToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(AppConstants.KEY_TOKEN);
  }

  /// deleteFcmToken
  Future<void> deleteFcmToken() async {
    final prefs = await SpUtil.getInstance();
    await prefs.remove(AppConstants.KEY_FIREBASE_TOKEN);
  }

  /// persistToken
  Future<void> persistToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(AppConstants.KEY_TOKEN, token);
  }

  /// persistFcmToken
  Future<void> persistFcmToken(String token) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putString(AppConstants.KEY_FIREBASE_TOKEN, token);
  }

  /// read authToken
  /// if returns null thats means there no SP instance
  Future<String?> get authToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(AppConstants.KEY_TOKEN);
  }

  /// read fcmToken
  /// if returns null thats means there no SP instance
  Future<String?> get fcmToken async {
    final prefs = await SpUtil.getInstance();
    return prefs.getString(AppConstants.KEY_FIREBASE_TOKEN);
  }

  /// check if hasToken or not
  Future<bool> get hasToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(AppConstants.KEY_TOKEN);
    if (token != null) return true;
    return false;
  }

  /// check if hasFcmToken or not
  Future<bool> get hasFcmToken async {
    final prefs = await SpUtil.getInstance();
    String? token = prefs.getString(AppConstants.KEY_FIREBASE_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }

  /// Persist App Theme
  Future<void> persistAppTheme(AppThemes theme) async {
    final prefs = await SpUtil.getInstance();
    await prefs.putInt(AppConstants.KEY_APP_THEME, theme.index);
    _appTheme = theme;
  }

  /// Get APP Theme
  Future<AppThemes> get _getAppTheme async {
    final prefs = await SpUtil.getInstance();
    int? token = prefs.getInt(AppConstants.KEY_APP_THEME);
    if (token == null) return AppThemes.LIGHT;
    return AppThemes.values[token];
  }

  static Size screenUtilDesignSize() {
    if (Device.get().isTablet) return const Size(1536, 2048);

    if (Device.get().isPhone) return const Size(375, 812);

    return const Size(375, 812);
  }
  String? get appLanguage => _appLanguage;

  set setAppLanguage(String value) {
    _appLanguage = value;
  }

}
