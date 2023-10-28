import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/utils.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/request/forgot_password_request.dart';
import '../screen/../state_m/provider/forgot_password_screen_notifier.dart';
import 'general_auth_screen.dart';

class ForgotPasswordScreenContent extends StatefulWidget {
  @override
  State<ForgotPasswordScreenContent> createState() =>
      _ForgotPasswordScreenContentState();
}

class _ForgotPasswordScreenContentState
    extends State<ForgotPasswordScreenContent> {
  late ForgotPasswordScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<ForgotPasswordScreenNotifier>(context);
    sn.context = context;
    return GeneralAuthScreen(
      isloading: sn.isLoading,
      onButtonTap: _forgotPassword,
      additionalTapText: '',
      buttonText: Translation.of(context).send,
      onAdditionalTextTapped: () {},
      appBar: TransparentAppBar(
        title: Translation.of(context).forgot_password,
      ),
      additionalText: '',
      child: Form(
        key: sn.formKey,
        child: Column(
          children: [
            SizedBox(
              height: 0.16.sh,
            ),
            PhoneNumberTextField(
              onDialChanged: (d) {},
              onInputChanged: (code) => sn.countryCode = code,
              textEditingController: sn.phoneController,
              focusNode: sn.phoneFocusNode,
              isoCode: sn.countryCode,
              onFieldSubmitted: () {
                _forgotPassword();
              },
            ),
          ],
        ),
      ),
    );
  }

  unFocus() {
    unFocusList(focus: [
      sn.phoneFocusNode,
    ]);
  }

  void _forgotPassword() {
    unFocus();
    if (sn.formKey.currentState!.validate()) {
      sn.accountCubit.forgotPassword(ForgotPasswordRequest(
        usernameOrEmailOrPhone: sn.phoneController.text,
      ));
    }
  }
}
