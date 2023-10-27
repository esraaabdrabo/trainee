import 'package:flutter/painting.dart';

import '../../../di/service_locator.dart';
import '../style/text_styles.dart';

/// Extension on [Color] class to make an easy predefined [TextStyle] from a
/// specific color
extension TextStyleExt on Color {
  TextStyle get bodyText1 => getIt<AppTextStyles>().bodyText1.copyWith(color: this);
  TextStyle get bodyText2 => getIt<AppTextStyles>().bodyText2.copyWith(color: this);
  TextStyle get button => getIt<AppTextStyles>().button.copyWith(color: this);
  TextStyle get caption => getIt<AppTextStyles>().caption.copyWith(color: this);
  TextStyle get headline1 => getIt<AppTextStyles>().headline1.copyWith(color: this);
  TextStyle get headline2 => getIt<AppTextStyles>().headline2.copyWith(color: this);
  TextStyle get headline3 => getIt<AppTextStyles>().headline3.copyWith(color: this);
  TextStyle get headline4 => getIt<AppTextStyles>().headline4.copyWith(color: this);
  TextStyle get headline5 => getIt<AppTextStyles>().headline5.copyWith(color: this);
  TextStyle get headline6 => getIt<AppTextStyles>().headline6.copyWith(color: this);
  TextStyle get overline => getIt<AppTextStyles>().overline.copyWith(color: this);
  TextStyle get subtitle1 => getIt<AppTextStyles>().subtitle1.copyWith(color: this);
  TextStyle get subtitle2 => getIt<AppTextStyles>().subtitle2.copyWith(color: this);
}
