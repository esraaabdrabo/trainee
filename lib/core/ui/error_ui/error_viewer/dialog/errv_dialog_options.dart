import 'package:flutter/cupertino.dart';

import '../errv_options.dart';

enum ErrVDialogType {
  message,
  confirmCancel,
}

class ErrVDialogOptions extends ErrorViewerOptions {
  final ErrVButtonOptions? cancelOptions;
  final ErrVButtonOptions? confirmOptions;
  final String? title, content;
  final bool? isDismissible;
  final ErrVDialogType errVDialogType;

  const ErrVDialogOptions({
    this.cancelOptions,
    this.confirmOptions,
    this.title,
    this.content,
    this.isDismissible,
    this.errVDialogType = ErrVDialogType.confirmCancel,
  });
}

class ErrVButtonOptions {
  final String? buttonText;
  final Color? textColor;
  final Function(BuildContext context)? onBtnPressed;

  ErrVButtonOptions({
    this.buttonText,
    this.textColor,
    this.onBtnPressed,
  });
}
