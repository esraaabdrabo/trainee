part of '../theme_config.dart';

ThemeData _getLightTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColorLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,

    /// Specifying fonts for application
    fontFamily: AppConfig().appLanguage!.startsWith(AppConstants.LANG_EN)
        ? GoogleFonts.poppins().fontFamily
        : AppConstants.FONT_FAMILY,
    textTheme: TextTheme(
      bodyText1: AppColors.textLight.bodyText1,
      bodyText2: AppColors.textLight.bodyText2,
      button: AppColors.textLight.button,
      caption: AppColors.textLight.caption,
      headline1: AppColors.textLight.headline1,
      headline2: AppColors.textLight.headline2,
      headline3: AppColors.textLight.headline3,
      headline4: AppColors.textLight.headline4,
      headline5: AppColors.textLight.headline5,
      headline6: AppColors.textLight.headline6,
      overline: AppColors.textLight.overline,
      subtitle1: AppColors.textLight.subtitle1,
      subtitle2: AppColors.textLight.subtitle2,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.white),
      hintStyle: TextStyle(color: AppColors.white),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: AppColors.white,
      )),
      disabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
    ),
    unselectedWidgetColor: AppColors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.accentColorLight,
      secondary: AppColors.accentColorLight,
    ).copyWith(secondary: AppColors.accentColorLight),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
}
