import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/ui/widgets/custom_image_widget.dart';

import 'custom_text.dart';

class ImageWithTitleWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String imgPath;
  final String title;
  final String? description;
  final double? textSize;
  final TextAlign? textAlign;
  ImageWithTitleWidget(
      {Key? key,
      this.width,
      this.height,
      required this.imgPath,
      required this.title,
      this.description,
      this.textSize,
      this.textAlign})
      : super(key: key);

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.9],
          colors: [
            AppColors.primaryColorLight.withOpacity(0.1),
            AppColors.primaryColorLight.withOpacity(0.8),
          ],
        ),
      ),
      child: description == null
          ? Padding(
              padding: EdgeInsets.all(8.w),
              child: CustomText(
                text: title,
                textAlign: textAlign ?? TextAlign.left,
                fontSize: textSize ?? AppConstants.textSize18,
                fontWeight: FontWeight.w500,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.bold,
                    fontSize: AppConstants.textSize14,
                    maxLines: 1,
                  ),
                  CustomText(
                    text: description ?? '',
                    textAlign: TextAlign.right,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: AppConstants.textSize14,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadius4),
      child: CustomImageWidget(
        child: _buildContent(),
        imgPath: imgPath,
        height: height,
        width: width,
      ),
    );
  }
}
