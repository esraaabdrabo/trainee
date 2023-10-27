import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/ui/widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final double? borderRadius;
  final double? textSize;
  final int? textMaxLines;
  final Size? size;
  final Color? backGroundColor;

  const CustomElevatedButton(
      {Key? key,
      required this.onTap,
      this.backGroundColor,
      required this.text,
      this.borderRadius,
      this.size,
      this.textSize,
      this.textMaxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: size,
        primary: backGroundColor,
      ),
      child: CustomText(
        text: text,
        fontSize: textSize ?? AppConstants.textSize16,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColorLight,
        maxLines: textMaxLines,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const CustomTextButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius2),
      ))),
      child: CustomText(
        text: text,
        fontSize: AppConstants.textSize16,
      ),
    );
  }
}
