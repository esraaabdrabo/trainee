import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/widgets/blur_widget.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../screen/../state_m/provider/about_app_screen_notifier.dart';

class AboutAppScreenContent extends StatefulWidget {
  @override
  State<AboutAppScreenContent> createState() => _AboutAppScreenContentState();
}

class _AboutAppScreenContentState extends State<AboutAppScreenContent> {
  late AboutAppScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<AboutAppScreenNotifier>(context);
    sn.context = context;
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gaps.vGap16,
            Image.asset(
              AppConstants.APP_LOGO_IMG,
              width: 117.w,
              fit: BoxFit.contain,
            ),
            Gaps.vGap40,
            BlurWidget(
              width: 1.sw,
              child: Padding(
                padding: EdgeInsets.all(14.w),
                child: CustomText(
                  text: sn.aboutAppPhrase,
                  fontSize: AppConstants.textSize16,
                  textAlign: TextAlign.center,
                  height: 2.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
