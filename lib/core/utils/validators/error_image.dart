import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppConstants.COACH1_IMAGE);
  }
}
