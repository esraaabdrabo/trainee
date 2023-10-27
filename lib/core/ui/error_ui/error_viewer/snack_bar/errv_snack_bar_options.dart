import 'package:flutter/material.dart';

import '../errv_options.dart';

class ErrVSnackBarOptions extends ErrorViewerOptions {
  final ErrVSnackBtnOptions? trailing;
  final Color? backgroundColor;

  const ErrVSnackBarOptions({
    this.trailing,
    this.backgroundColor,
  });
}

class ErrVSnackBtnOptions {
  final String? text;
  final IconData? icon;
  final Color? color;

  ErrVSnackBtnOptions({
    this.text,
    this.icon,
    this.color,
  });
}
