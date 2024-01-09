import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';

class MoreScreenDeleteAccountButton extends StatelessWidget {
  const MoreScreenDeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showDeleteAccountDialog(context);
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

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.backgroundColorLight,
        title: Text('Confirm Deletion'),
        content: Text('Are you sure you want to delete your account?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Delete',
              style: TextStyle(color: AppColors.lightGrey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}
