import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/utils.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/enums/languages_enum.dart';
import '../../../../core/localization/localization_provider.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/widgets/blur_widget.dart';
import '../../../../core/ui/widgets/custom_checkBox.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/title_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../account/presentation/screen/change_password_screen.dart';
import '../../../category/presentation/screen/category_list_screen.dart';
import '../../../coach/presentation/screen/coaches_list_screen.dart';
import '../../../orders/presenation/screens/order_screen.dart';
import '../../../restaurant/presentation/screen/restaurant_view.dart';
import '../../../shop/presentation/screen/shops_view.dart';
import '../screen/../state_m/provider/more_screen_notifier.dart';
import 'about_app_screen.dart';
import 'feedback_screen.dart';
import 'privacy_policy_screen.dart';

class MoreScreenContent extends StatefulWidget {
  @override
  State<MoreScreenContent> createState() => _MoreScreenContentState();
}

class _MoreScreenContentState extends State<MoreScreenContent> {
  late MoreScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<MoreScreenNotifier>(context);
    sn.context = context;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              title: Translation.of(context).goto,
            ),
            Gaps.vGap16,
            Wrap(
              spacing: 40.w,
              runSpacing: 16.h,
              children: [
                _buildChipWidget(
                    title: Translation.of(context).categories,
                    imgPath: AppConstants.SWIMMING_IMG,
                    onPressed: () {
                      Nav.to(CategoryListScreen.routeName, context: context);
                    }),
                _buildChipWidget(
                    title: Translation.of(context).coaches,
                    imgPath: AppConstants.COACH1_IMAGE,
                    onPressed: () {
                      Nav.to(CoachesListScreen.routeName, context: context);
                    }),
                _buildChipWidget(
                    title: Translation.of(context).restaurants,
                    imgPath: AppConstants.MOTCHY2_IMG,
                    onPressed: () {
                      Nav.to(RestaurantView.routeName, context: context);
                    }),
                // _buildChipWidget(
                //     title: Translation.of(context).dishes,
                //     imgPath: AppConstants.KARAM_IMG,
                //     onPressed: () {
                //       Nav.to(CoachProfileScreen.routeName,arguments: TempCoachModel(
                //           name: '', job: '', location: '', rate: 5, imagePath: ''));
                //     }),
                _buildChipWidget(
                    title: Translation.of(context).supplements_shops,
                    imgPath: AppConstants.VEGGIE2_IMG,
                    onPressed: () {
                      Nav.to(ShopsView.routeName, context: context);
                    }),
                // _buildChipWidget(
                //     title: Translation.of(context).supplements,
                //     imgPath: AppConstants.KCAL2_IMG,
                //     onPressed: () {
                //
                //     }),
                _buildChipWidget(
                    title: Translation.of(context).my_orders,
                    imgPath: AppConstants.VEGGIE_IMG,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyOrderView(),
                          ));
                    }),
              ],
            ),
            Gaps.vGap30,
            TitleWidget(
              title: Translation.of(context).account_settings,
            ),
            Gaps.vGap10,
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Nav.to(ChangePasswordScreen.routeName, context: context);
              },
              child: Padding(
                padding: EdgeInsets.all(6.h),
                child: CustomText(
                  text: Translation.of(context).change_password,
                  fontSize: AppConstants.textSize14,
                ),
              ),
            ),
            Gaps.vGap24,
            TitleWidget(
              title: Translation.of(context).app_settings,
            ),
            Gaps.vGap16,
            _buildAppSettingsWidget(),
            Gaps.vGap30,
          ],
        ),
      ),
    );
  }

  Widget _buildChipWidget(
      {required String title,
      required String imgPath,
      required Function onPressed}) {
    double? rightPosition;
    double? leftPosition;
    if (sn.languagesEnum == LanguagesEnum.arabic) {
      rightPosition = 0.0;
    } else {
      leftPosition = 0.0;
    }
    return GestureDetector(
      onTap: () {
        onPressed();
      },
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
                        flex: 4,
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
                              text: title,
                              fontSize: AppConstants.textSize14,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
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
                  imgPath,
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

  Widget _buildAppSettingsWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: Translation.of(context).language,
            fontSize: AppConstants.textSize16,
          ),
          Gaps.vGap16,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sn.languagesEnum == LanguagesEnum.arabic
                  ? BlurWidget(
                      height: 20.h,
                      width: 57.w,
                      child: Center(
                          child: CustomText(
                        text: Translation.of(context).arabic,
                        fontSize: AppConstants.textSize14,
                      )),
                    )
                  : GestureDetector(
                      onTap: () {
                        Provider.of<LocalizationProvider>(context,
                                listen: false)
                            .changeLanguage(
                                const Locale(AppConstants.LANG_AR), context);
                        sn.languagesEnum = LanguagesEnum.arabic;
                      },
                      behavior: HitTestBehavior.opaque,
                      child: SizedBox(
                        height: 20.h,
                        width: 57.w,
                        child: Center(
                          child: CustomText(
                            text: Translation.of(context).arabic,
                            fontSize: AppConstants.textSize14,
                          ),
                        ),
                      ),
                    ),
              Gaps.hGap32,
              sn.languagesEnum == LanguagesEnum.english
                  ? BlurWidget(
                      height: 20.h,
                      width: 60.w,
                      child: Center(
                        child: Container(
                          child: CustomText(
                            text: Translation.of(context).english,
                            fontSize: AppConstants.textSize14,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Provider.of<LocalizationProvider>(context,
                                listen: false)
                            .changeLanguage(
                                const Locale(AppConstants.LANG_EN), context);
                        sn.languagesEnum = LanguagesEnum.english;
                      },
                      behavior: HitTestBehavior.opaque,
                      child: SizedBox(
                        height: 20.h,
                        width: 60.w,
                        child: Center(
                          child: CustomText(
                            text: Translation.of(context).english,
                            fontSize: AppConstants.textSize14,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Nav.to(PrivacyPolicyScreen.routeName, context: context);
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: CustomText(
                text: Translation.of(context).privacy_policy,
                fontSize: AppConstants.textSize16,
              ),
            ),
          ),
          SizedBox(
            height: 19.h,
            child: Row(
              children: [
                CustomText(
                  text: Translation.of(context).enable_notifications,
                  fontSize: AppConstants.textSize16,
                ),
                const Spacer(),
                Transform.scale(
                  scale: 1.5,
                  child: CustomCheckbox(
                    value: true,
                    onChanged: (value) {},
                    checkColor: AppColors.white,
                    activeColor: AppColors.accentColorLight,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Nav.to(FeedbackScreen.routeName, context: context);
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
              child: CustomText(
                text: Translation.of(context).feedback,
                fontSize: AppConstants.textSize16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Nav.to(AboutAppScreen.routeName, context: context);
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
              child: CustomText(
                text: Translation.of(context).about_app,
                fontSize: AppConstants.textSize16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              logout(context);
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
              child: CustomText(
                text: Translation.of(context).logOut,
                fontSize: AppConstants.textSize16,
              ),
            ),
          ),
          Gaps.vGap40,
        ],
      ),
    );
  }
}
