import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

import '../errv_options.dart';

class ErrVToastOptions extends ErrorViewerOptions {
  final ToastGravity? toastGravity;
  final Color? backGroundColor;
  final Color? textColor;

  const ErrVToastOptions({
    this.toastGravity,
    this.backGroundColor,
    this.textColor,
  });
}
