import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app/app_constants.dart';

class SplashScreenContent extends StatefulWidget {
  SplashScreenContent({Key? key}) : super(key: key);

  @override
  _SplashScreenContentState createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // height: 0.27.sh,
            width: 0.52.sw,
            child: Image.asset(AppConstants.APP_LOGO_IMG),
          ),
        ],
      ),
    );
  }
}
