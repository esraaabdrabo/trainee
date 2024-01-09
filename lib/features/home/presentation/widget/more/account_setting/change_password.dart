import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/navigation/nav.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/features/account/presentation/screen/change_password_screen.dart';

class MoreScreenChangePasswordButton extends StatelessWidget {
  const MoreScreenChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Nav.to(ChangePasswordScreen.routeName, context: context),
      child: Padding(
        padding: EdgeInsets.all(6.h),
        child: CustomText(
          text: LanguageHelper.tr(context).change_password,
          fontSize: AppConstants.textSize14,
        ),
      ),
    );
  }
}
