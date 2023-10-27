import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

/// Centralized the text styles that are used widely in app
@lazySingleton
class AppTextStyles {
  static AppTextStyles _instance = AppTextStyles._init();
  static bool isPortrait = true;

  factory AppTextStyles() => _instance;

  AppTextStyles._init();

  /// Dialog Titles
  TextStyle get bodyText1 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;

    if (portrait)
      return TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      );

    return TextStyle(
      fontSize: 80.sp,
      fontWeight: FontWeight.w400,
    );
  }

  /// Default Text
  TextStyle get bodyText2 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;

    if (portrait)
      return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      );

    return TextStyle(
      fontSize: 67.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get button {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      );

    return TextStyle(
      fontSize: 75.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get caption {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      );

    return TextStyle(
      fontSize: 55.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headline1 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      );
    return TextStyle(
      fontSize: 73.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headline2 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      );
    return TextStyle(
      fontSize: 65.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headline3 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      );
    return TextStyle(
      fontSize: 59.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headline4 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      );
    return TextStyle(
      fontSize: 53.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headline5 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      );
    return TextStyle(
      fontSize: 49.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get headline6 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      );
    return TextStyle(
      fontSize: 47.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get overline {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      );
    return TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w400,
    );
  }

  /// Radio Button Title - TextField
  TextStyle get subtitle1 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      );

    return TextStyle(
      fontSize: 70.sp,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get subtitle2 {
    bool portrait = ScreenUtil().orientation == Orientation.portrait;
    if (portrait)
      return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      );
    return TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
