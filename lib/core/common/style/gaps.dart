import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dimens.dart';

/// Widgets to add spaces in the screen, easy to reach and use, the main benefit
/// rather than easy to use is that all same (GAPS) will refer to the same -
/// object in memory, that will make a better performance
class Gaps {
  const Gaps._();
  static Widget hGap4 = SizedBox(width: Dimens.dp4.w);
  static Widget hGap8 =  SizedBox(width: Dimens.dp8.w);
  static Widget hGap12 = SizedBox(width: Dimens.dp12.w);
  static Widget hGap16 = SizedBox(width: Dimens.dp16.w);
  static Widget hGap20 = SizedBox(width: Dimens.dp20.w);
  static Widget hGap24 = SizedBox(width: Dimens.dp24.w);
  static Widget hGap32 = SizedBox(width: Dimens.dp32.w);

  static Widget vGap4 = SizedBox(height: Dimens.dp4.h);
  static Widget vGap8 = SizedBox(height: Dimens.dp8.h);
  static Widget vGap10 = SizedBox(height: Dimens.dp10.h);
  static Widget vGap12 = SizedBox(height: Dimens.dp12.h);
  static Widget vGap14 = SizedBox(height: Dimens.dp14.h);
  static Widget vGap16 = SizedBox(height: Dimens.dp16.h);
  static Widget vGap24 = SizedBox(height: Dimens.dp24.h);
  static Widget vGap32 = SizedBox(height: Dimens.dp32.h);
  static Widget vGap30 = SizedBox(height: Dimens.dp30.h);
  static Widget vGap40 = SizedBox(height: Dimens.dp40.h);


  static const Widget line = const Divider();

  static const Widget vLine = const SizedBox(
    width: 0.6,
    height: 24.0,
    child: const VerticalDivider(),
  );

  static const Widget empty = const SizedBox.shrink();
}