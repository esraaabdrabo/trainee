import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/common/utils.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text.dart';
import 'package:upgrade_traine_project/features/account/presentation/state_m/bloc/account_cubit.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/more_cubit.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/bloc/more_state.dart';
import 'package:upgrade_traine_project/features/profile/presentation/state_m/cubit/profile_cubit.dart';

class MoreScreenDeleteAccountButton extends StatelessWidget {
  const MoreScreenDeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoreCubit(),
        child: BlocConsumer<MoreCubit, MoreState>(
          listener: (p, c) {
            if (c is MoreAccountDeletedSucc) {
              logout(context);
            }
          },
          builder: (context, state) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => showDeleteAccountDialog(context,
                () => MoreCubit.of(context).deleteAccount(_getUserId(context))),
            child: Padding(
              padding: EdgeInsets.all(6.h),
              child: CustomText(
                text: LanguageHelper.tr(context).delete_acc,
                fontSize: AppConstants.textSize14,
              ),
            ),
          ),
        ));
  }
}

void showDeleteAccountDialog(BuildContext context, Function deleteFunction) {
  var tr = LanguageHelper.tr(context);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.backgroundColorLight,
        content: Text(tr.delete_acc_dialog_content),
        actions: [
          TextButton(
            onPressed: () {
              deleteFunction();
              Navigator.of(context).pop();
            },
            child: Text(
              tr.confirm,
              style: const TextStyle(color: AppColors.lightGrey),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(tr.cancel),
          ),
        ],
      );
    },
  );
}

int _getUserId(BuildContext context) {
  return BlocProvider.of<ProfileCubit>(context).profileModel!.result!.id!;
}
