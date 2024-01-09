import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/navigation/nav.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/features/account/presentation/screen/change_password_screen.dart';
import 'package:upgrade_traine_project/features/account/presentation/widget/custom_button_widget.dart';

class MoreScreenDeleteAccountButton extends StatelessWidget {
  const MoreScreenDeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(
                    "delete account",
                    style: TextStyle(color: AppColors.black_text),
                  ),
                  actions: [
                    CustomButton(
                        text: "yes",
                        onPressed: () {},
                        textColor: AppColors.red),
                    CustomButton(
                      text: "no",
                      onPressed: () {},
                      textColor: AppColors.black_text,
                    )
                  ],
                ));
      },
      child: Padding(
        padding: EdgeInsets.all(6.h),
        child: CustomText(
          text: "delete account", //LanguageHelper.tr(context).delete,
          fontSize: AppConstants.textSize14,
        ),
      ),
    );
  }
}
