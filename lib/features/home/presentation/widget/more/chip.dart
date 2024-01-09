import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/blur_widget.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';

class CustomChipWidget extends StatefulWidget {
  const CustomChipWidget(
      {required this.imgPath,
      required this.onPressed,
      required this.title,
      super.key});
  final String title;
  final String imgPath;
  final Function onPressed;

  @override
  State<CustomChipWidget> createState() => _CustomChipWidgetState();
}

class _CustomChipWidgetState extends State<CustomChipWidget> {
  double? rightPosition;
  double? leftPosition;

  @override
  Widget build(BuildContext context) {
    if (LanguageHelper.isAr(context)) {
      rightPosition = 0.0;
    } else {
      leftPosition = 0.0;
    }
    return GestureDetector(
      onTap: () => widget.onPressed(),
      child: Container(
        width: 143.w,
        height: 45.h,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.all(1.w),
                child: BlurWidget(
                  borderRadius: AppConstants.borderRadius32,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 4
                      ),
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          height: 15.h,
                          child: FittedBox(
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            child: CustomText(
                              textAlign: TextAlign.center,
                              text: widget.title,
                              fontSize: AppConstants.textSize14,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: rightPosition,
              left: leftPosition,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(AppConstants.borderRadius32),
                child: Image.asset(
                  widget.imgPath,
                  height: 45.h,
                  width: 45.w,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
