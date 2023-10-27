part of '../theme_config.dart';

ThemeData _getDarkTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColorLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,

    /// Specifying fonts for application
    fontFamily: Intl.getCurrentLocale() == AppConstants.LANG_EN
        ? GoogleFonts.poppins().fontFamily
        : GoogleFonts.cairo().fontFamily,

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
    ), colorScheme: const ColorScheme.dark(
      primary: AppColors.accentColorLight,
      secondary: AppColors.accentColorLight,
    ).copyWith(secondary: AppColors.accentColorLight),
  );
}
