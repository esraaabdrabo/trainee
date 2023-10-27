import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/style/gaps.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/request/change_password_request.dart';
import '../screen/../state_m/provider/change_password_screen_notifier.dart';
import 'general_auth_screen.dart';

class ChangePasswordScreenContent extends StatefulWidget {
  @override
  State<ChangePasswordScreenContent> createState() =>
      _ChangePasswordScreenContentState();
}

class _ChangePasswordScreenContentState
    extends State<ChangePasswordScreenContent> {
  late ChangePasswordScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<ChangePasswordScreenNotifier>(context);
    sn.context = context;
    return GeneralAuthScreen(
      onButtonTap: _createNewPassword,
      isloading: sn.isLoading,
      additionalTapText: '',
      buttonText: Translation.of(context).save,
      onAdditionalTextTapped: () {},
      appBar: TransparentAppBar(
        title: Translation.of(context).change_password,
      ),
      additionalText: '',
      child: Form(
        key: sn.formKey,
        child: Column(
          children: [
            SizedBox(
              height: 0.16.sh,
            ),
            PasswordTextField(
              controller: sn.oldPasswordController,
              passwordSecure: sn.oldPasswordSecure,
              textInputAction: TextInputAction.next,
              text: Translation.of(context).current_password,
              focusNode: sn.oldPasswordFocusNode,
              onFiledSubmitted: () {
                FocusScope.of(context).requestFocus();
              },
              hidePassword: (bool) {
                setState(() {
                  sn.oldPasswordSecure = bool;
                });
              },
            ),
            Gaps.hGap8,
            PasswordTextField(
              controller: sn.newPasswordController,
              passwordSecure: sn.newPasswordSecure,
              textInputAction: TextInputAction.next,
              focusNode: sn.newPasswordFocusNode,
              text: Translation.of(context).new_password,
              onFiledSubmitted: () {
                FocusScope.of(context).requestFocus();
              },
              hidePassword: (bool) {
                setState(() {
                  sn.newPasswordSecure = bool;
                });
              },
            ),
            Gaps.hGap8,
            PasswordTextField(
              controller: sn.confirmNewPasswordController,
              passwordSecure: sn.confirmNewPasswordSecure,
              textInputAction: TextInputAction.done,
              focusNode: sn.confirmNewPasswordFocusNode,
              isConfirmPassword: true,
              otherPasswordController: sn.newPasswordController,
              onFiledSubmitted: () {
                _createNewPassword();
              },
              hidePassword: (bool) {
                setState(() {
                  sn.confirmNewPasswordSecure = bool;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _createNewPassword() {
    if (sn.formKey.currentState!.validate())
      sn.accountCubit.changePassword(ChangePasswordRequest(
          currentPassword: sn.oldPasswordController.text,
          newPassword: sn.newPasswordController.text));
  }
}
