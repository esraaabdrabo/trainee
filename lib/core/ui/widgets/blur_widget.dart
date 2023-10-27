import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/constants/app/app_constants.dart';

class BlurWidget extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? blurDegree;
  final double? borderRadius;
  final Color? blurColor;

  const BlurWidget({Key? key, this.child, this.width,  this.height, this.blurDegree, this.borderRadius, this.blurColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
      BorderRadius.circular(borderRadius?? AppConstants.borderRadius10),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurDegree?? AppConstants.blurDegree,
          sigmaY: blurDegree?? AppConstants.blurDegree,
        ),
        child: Container(
          height: height,
          width: width,
          color: blurColor??AppColors.blur,
          child: child?? Container(),
        ),
      ),
    );
  }
}
