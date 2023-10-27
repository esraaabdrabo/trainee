import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/l10n.dart';
import '../../../common/app_config.dart';
import '../../../constants/app/app_constants.dart';
import '../../../constants/enums/app_options_enum.dart';
import '../../widgets/custom_text.dart';

Widget buildErrorScreen({
  required BuildContext context,
  @required VoidCallback? callback,
  bool disableRetryButton = false,
  String? title,
  String? content,
  String? imageUrl,
  String? buttonContent,
  IconData? icon,
  ErrorAnimation? errorAnimation,
}) {
  final options = AppConfig().appOptions;

  Widget image = const SizedBox.shrink();
  switch (options.errorViewOption) {
    case ErrorWidgetOptions.IMAGE:
      if (imageUrl != null && imageUrl != "")
        image = Image.asset(
          imageUrl,
          width: 1.sw,
        );
      break;
    case ErrorWidgetOptions.LOTTIE:
      if (errorAnimation != null)
        image = SizedBox(
          height: ScreenUtil().setHeight(500),
          width: 1.sw,
          child: GestureDetector(
            onTap: () async {
              if (!errorAnimation.animationController.isAnimating) {
                errorAnimation.animationController.reset();
                errorAnimation.animationController.forward();
              }
            },
            child: Lottie.asset(
              errorAnimation.animUrl,
              controller: errorAnimation.animationController,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                errorAnimation.animationController
                  ..duration = composition.duration
                  ..forward();
              },
              repeat: false,
            ),
          ),
        );
      break;
    case ErrorWidgetOptions.NONE:
      image = const SizedBox.shrink();
      break;
  }

  return Center(
    child: Container(
      height: 1.sh,
      width: 1.sw,
      // width: ScreenUtil().setHeight(630),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.2.sh,
            ),
            image,
            SizedBox(
              height: 0.1.sh,
            ),
            CustomText(
              text: title ?? "",
              fontSize: AppConstants.textSize20,
            ),
            if (content != null)
              Container(
                width: ScreenUtil().setWidth(800),
                height: ScreenUtil().setHeight(200),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: ScreenUtil().setSp(40),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            SizedBox(
              height:
                  disableRetryButton != true ? ScreenUtil().setHeight(100) : 0,
            ),
            if (disableRetryButton == false && callback != null)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: callback,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon != null
                          ? Icon(
                              icon,
                              color: Colors.white,
                            )
                          : const SizedBox(),
                      icon != null
                          ? const SizedBox(
                              width: 6,
                            )
                          : const SizedBox(),
                      CustomText(
                        text: buttonContent ?? Translation.of(context).retry,
                        fontWeight: FontWeight.w300,
                        fontSize: AppConstants.textSize16,
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: 0.3.sh,
            ),
          ],
        ),
      ),
    ),
  );
}

class ErrorAnimation {
  final String animUrl;
  final AnimationController animationController;

  ErrorAnimation({
    required this.animUrl,
    required this.animationController,
  });
}
