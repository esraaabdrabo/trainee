import 'package:flutter/material.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/constants/app/app_constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final TextDecoration? decoration;
  final double? height;
  final double? decorationThickness;
  final Color? decorationColor;

  const CustomText(
      {Key? key,
      required this.text,
      this.color,
        this.decorationColor,
      this.decoration,
      this.fontWeight,
      this.fontSize,
      this.textAlign,
      this.textOverflow,
      this.maxLines,
      this.decorationThickness,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? AppColors.textLight,
          height: height,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? AppConstants.textSize12,
          fontFamily: 'Tajawal',
          decoration: decoration,
          decorationColor:decorationColor,
          decorationThickness: decorationThickness,
          //decorationStyle: TextDecorationStyle(),
          overflow: textOverflow ?? TextOverflow.visible),
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
