import 'package:flutter/material.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/constants/app/app_constants.dart';

import 'custom_text.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function? subtitleColorTapped;
  final Color? titleColor;
  final Color? subtitleColor;
  final double? subtitleSize;
  const TitleWidget(
      {Key? key,
      required this.title,
      this.subtitleColorTapped,
      this.titleColor,
      this.subtitleColor,
      this.subtitle,
      this.subtitleSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          text: title,
          color: titleColor ?? AppColors.accentColorLight,
          fontSize: AppConstants.textSize16,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            if (subtitleColorTapped != null) subtitleColorTapped!();
          },
          child: subtitle != null
              ? CustomText(
                  text: subtitle!,
                  fontSize: subtitleSize ?? AppConstants.textSize12,
                  color: subtitleColor ?? AppColors.lightGreyFontColor,
                  fontWeight: FontWeight.w500,
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
