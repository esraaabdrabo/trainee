import 'package:flutter/material.dart';
import 'errv_snack_bar_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showErrorSnackBar({
  required BuildContext context,
  String? message,
  VoidCallback? callback,
  ErrVSnackBarOptions? errVSnackBarOptions,
}) {
  final snackBar = SnackBar(
    backgroundColor:
        errVSnackBarOptions?.backgroundColor ?? Theme.of(context).primaryColor,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: errVSnackBarOptions?.trailing == null ? 0.85.sw : 0.5.sw,
          child: Text(
            message ?? '',
            style: TextStyle(
              color: errVSnackBarOptions?.trailing?.color ?? Colors.white,
            ),
          ),
        ),
        if (errVSnackBarOptions?.trailing != null)
          InkWell(
            onTap: callback,
            child: Row(
              children: [
                if (errVSnackBarOptions?.trailing?.text != null)
                  Text(
                    errVSnackBarOptions?.trailing?.text ?? '',
                    style: TextStyle(
                      color:
                          errVSnackBarOptions?.trailing?.color ?? Colors.white,
                    ),
                  ),
                if (errVSnackBarOptions?.trailing?.icon != null)
                  Icon(
                    errVSnackBarOptions?.trailing?.icon,
                    color: errVSnackBarOptions?.trailing?.color ?? Colors.white,
                  ),
              ],
            ),
          )
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
