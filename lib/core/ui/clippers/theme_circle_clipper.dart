import 'dart:math';
import 'dart:ui';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

@immutable
class CustomThemeSwitcherCircleClipper implements ThemeSwitcherClipper {
  const CustomThemeSwitcherCircleClipper();

  @override
  Path getClip(Size size, Offset? offset, double? sizeRate) {
    return Path()
      ..addOval(
        Rect.fromCircle(
          center: offset ?? const Offset(0, 0),
          radius: lerpDouble(
              0,
              _calcMaxRadius(
                size,
                offset ?? const Offset(0, 0),
              ),
              sizeRate!)!,
        ),
      );
  }

  @override
  bool shouldReclip(
      CustomClipper<Path> oldClipper, Offset? offset, double? sizeRate) {
    return true;
  }

  static double _calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }
}
