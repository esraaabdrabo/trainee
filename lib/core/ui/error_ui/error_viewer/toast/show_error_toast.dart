import 'package:fluttertoast/fluttertoast.dart' as toast;

import '../../../../common/app_colors.dart';
import '../../../toast.dart';
import 'errv_toast_options.dart';

void showErrorToast({
  String? message,
  required ErrVToastOptions errVToastOptions,
}) {
  Toast.show(
    message ?? "",
    androidDuration: toast.Toast.LENGTH_LONG,
    gravity: errVToastOptions.toastGravity ?? toast.ToastGravity.BOTTOM,
    backgroundColor: errVToastOptions.backGroundColor ?? AppColors.darkGrey,
    textColor: errVToastOptions.textColor ?? AppColors.white_text,
  );
}
