import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../di/service_locator.dart';
import '../bloc/app_config/app_config_cubit.dart';
import '../constants/app/app_constants.dart';
import '../constants/enums/app_theme_enum.dart';
import '../localization/localization_provider.dart';
import '../localization/restart_widget.dart';
import '../theme/theme_colors.dart';
import '../theme/theme_config.dart';
import 'app_config.dart';

/// This function for move cursor from A to B
/// and will be take 3 parameter
/// [context] to know which screen we are
/// [currentFocus] where are you now ? which text form field
/// [nextFocus] where will be when called this function
/// [changeTheme] to change application theme
fieldFocusChange(
  BuildContext context,
  FocusNode currentFocus,
  FocusNode nextFocus,
) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

/// This for unFocus nodes
unFocusList({required List<FocusNode> focus}) {
  for (var element in focus) {
    element.unfocus();
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

changeTheme(BuildContext context) async {
  var brightness = Theme.of(context).brightness;
  await AppConfig().persistAppTheme(
    brightness == Brightness.light ? AppThemes.DARK : AppThemes.LIGHT,
  );
  ThemeSwitcher.of(context).changeTheme(
    theme: brightness == Brightness.light
        ? getIt<ThemeConfig>().darkTheme
        : getIt<ThemeConfig>().lightTheme,
    isReversed: brightness == Brightness.dark ? true : false,
  );
  ThemeColors().updateThemeMode();
}

Future<Position?> getMyLocation() async {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return null;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return null;
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

String getTranslation(
    {required BuildContext context,
    String? arText,
    String? enText,
    String? alternativeText}) {
  return Provider.of<LocalizationProvider>(context).appLocal.languageCode ==
              AppConstants.LANG_EN &&
          enText != null
      ? enText
      : arText != null
          ? arText
          : alternativeText ?? '';
}

logout(context) async {
  BlocProvider.of<AppConfigCubit>(context).userLogout(context: context);
  RestartWidget.restartApp(context);
}
