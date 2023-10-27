import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/utils.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/request/create_new_password_request.dart';
import '../screen/../state_m/provider/create_new_password_screen_notifier.dart';
import 'general_auth_screen.dart';

class CreateNewPasswordScreenContent extends StatefulWidget {
  @override
  State<CreateNewPasswordScreenContent> createState() =>
      _CreateNewPasswordScreenContentState();
}

class _CreateNewPasswordScreenContentState
    extends State<CreateNewPasswordScreenContent> {
  late CreateNewPasswordScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<CreateNewPasswordScreenNotifier>(context);
    sn.context = context;
    return GeneralAuthScreen(
      onButtonTap: _createNewPassword,
      isloading: sn.isLoading,
      additionalTapText: '',
      buttonText: Translation.of(context).save,
      onAdditionalTextTapped: () {},
      appBar: TransparentAppBar(
        title: Translation.of(context).new_password,
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
              controller: sn.passwordController,
              passwordSecure: sn.passwordSecure,
              textInputAction: TextInputAction.next,
              focusNode: sn.passwordFocusNode,
              onFiledSubmitted: () {
                fieldFocusChange(
                    context, sn.passwordFocusNode, sn.confirmPasswordFocusNode);
              },
              hidePassword: (bool) {
                setState(() {
                  sn.passwordSecure = bool;
                });
              },
            ),
            Gaps.hGap8,
            PasswordTextField(
              controller: sn.confirmPasswordController,
              passwordSecure: sn.confirmPasswordSecure,
              textInputAction: TextInputAction.done,
              focusNode: sn.confirmPasswordFocusNode,
              isConfirmPassword: true,
              otherPasswordController: sn.passwordController,
              onFiledSubmitted: () {
                _createNewPassword();
              },
              hidePassword: (bool) {
                setState(() {
                  sn.confirmPasswordSecure = bool;
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
      sn.accountCubit.createNewPassword(CreateNewPasswordRequest(
          usernameOrEmailOrPhone: sn.phone,
          code: "000000",
          newPassword: sn.passwordController.text));
  }
}
