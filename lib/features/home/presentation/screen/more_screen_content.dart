import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/more_screen/about/about_app_screen.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/more_screen/feedback/feedback_screen.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/more_screen/privacy_policy/privacy_policy_screen.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/more_cubit.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/more_state.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/more/account_setting/section.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/more/sections.dart';
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
import '../screen/../state_m/provider/more_screen_notifier.dart';

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
            TitleWidget(title: Translation.of(context).goto),
            Gaps.vGap16,
            const MoreScreenSections(),
            const AccountSettingWidget(),
            TitleWidget(title: Translation.of(context).app_settings),
            Gaps.vGap16,
            _buildAppSettingsWidget(),
            Gaps.vGap30,
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
          BlocProvider(
              create: (context) => MoreCubit(),
              child: BlocBuilder<MoreCubit, MoreState>(
                builder: (context, state) => SizedBox(
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
                          value: MoreCubit.of(context).isEnableNotification,
                          onChanged: (value) =>
                              MoreCubit.of(context).enableNotifications(),
                          checkColor: AppColors.white,
                          activeColor: AppColors.accentColorLight,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
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
