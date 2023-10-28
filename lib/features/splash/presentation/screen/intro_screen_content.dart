import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/widgets/custom_button.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../generated/l10n.dart';
import '../../../account/presentation/screen/login_screen.dart';

class IntroScreenContent extends StatefulWidget {
  const IntroScreenContent({Key? key}) : super(key: key);

  @override
  _IntroScreenContentState createState() => _IntroScreenContentState();
}

class _IntroScreenContentState extends State<IntroScreenContent> {
  final PageController _pageController = PageController();
  double _currentPage = 0;
  int _maxPages = 3;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_currentPage == 2) {
        Nav.off(LoginScreen.routeName, cleanHistory: true, context: context);
      } else {
        setState(() {
          _currentPage = _pageController.page!;
        });
      }
    });
  }

  void _onNextPressed() {
    if (_pageController.page == 2) {
      Nav.off(LoginScreen.routeName, cleanHistory: true, context: context);
    } else {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  void _onSkipPressed() {
    Nav.off(LoginScreen.routeName, cleanHistory: true, context: context);
  }

  Widget _buildIntroPageView(
      {required String title,
      required String body,
      required String imagePath,
      required String shadowImagePath,
      required bool isRight}) {
    double? right;
    double? left;
    if (isRight)
      right = 0;
    else
      left = 0;
    return Container(
      child: Stack(
        children: [
          Container(
            height: 1.sh,
            width: 1.sw,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                imagePath,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppColors.darken_shadow.withOpacity(0.5), BlendMode.dstATop),
            )),
          ),
          Positioned(
            right: right,
            left: left,
            child: SizedBox(
                height: 0.9.sh,
                width: 0.9.sw,
                child: Image.asset(
                  shadowImagePath,
                  fit: BoxFit.fill,
                )),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.47.sh,
                ),
                SizedBox(
                    width: 0.143.sw, child: Image.asset(AppConstants.PLAY_IMG)),
                SizedBox(
                  height: 0.101.sh,
                ),
                CustomText(
                  text: title,
                  fontSize: AppConstants.textSize20,
                ),
                Gaps.vGap16,
                CustomText(
                  text: body,
                  fontWeight: FontWeight.w300,
                  fontSize: AppConstants.textSize14,
                ),
                SizedBox(
                  height: 0.09.sh,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildIntroPageView(
                  title: Translation.of(context).keep_fitness,
                  body: Translation.of(context).intro1_text,
                  imagePath: AppConstants.INTRO_BACK1_IMG,
                  shadowImagePath: AppConstants.SHADOW1_IMG,
                  isRight: true),
              _buildIntroPageView(
                  title: Translation.of(context).lookup_coach,
                  body: Translation.of(context).intro2_text,
                  imagePath: AppConstants.INTRO_BACK2_IMG,
                  shadowImagePath: AppConstants.SHADOW2_IMG,
                  isRight: false),
              _buildIntroPageView(
                  title: Translation.of(context).training_daily,
                  body: Translation.of(context).intro3_text,
                  imagePath: AppConstants.INTRO_BACK3_IMG,
                  shadowImagePath: AppConstants.SHADOW3_IMG,
                  isRight: true)
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 0.125.sh,
              ),
              SizedBox(
                  width: 0.57.sw,
                  child: Image.asset(AppConstants.APP_LOGO_IMG_HORIZONTAL)),
              SizedBox(
                height: 0.61.sh,
              ),
              DotsIndicator(
                dotsCount: _maxPages,
                position: _currentPage,
                decorator: DotsDecorator(
                    color: AppColors.white,
                    activeColor: AppColors.white,
                    size: Size(6.w, 6.h),
                    activeSize: Size(20.w, 6.h),
                    activeShape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.borderRadius3)),
                    spacing: EdgeInsets.all(3.w)),
              ),
              Gaps.vGap32,
              SizedBox(
                width: 1.sw,
                child: Padding(
                  padding: const EdgeInsets.only(left: 32, right: 16),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 104.w,
                          height: 44.h,
                          child: CustomElevatedButton(
                            onTap: _onNextPressed,
                            text: Translation.of(context).next,
                          )),
                      const Spacer(),
                      SizedBox(
                          width: 104.w,
                          height: 44.h,
                          child: CustomTextButton(
                            text: Translation.of(context).skip,
                            onTap: _onSkipPressed,
                          )),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
