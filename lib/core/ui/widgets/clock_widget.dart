import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/constants/app/app_constants.dart';

import 'custom_text.dart';

class ClockWidget extends StatelessWidget {
  final double duration;
  const ClockWidget({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstants.CLOCK_IMG),
        ),
      ),
      child: Padding(
        padding:
        EdgeInsets.only(right: 12.w, left: 12.w, top: 15.h, bottom: 12.h),
        child: CustomText(
          text: duration.toInt().toString(),
          fontSize: AppConstants.textSize12,
          color: AppColors.primaryColorLight,
        ),
      ),
    );
  }
}
