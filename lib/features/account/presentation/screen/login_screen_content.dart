import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/features/account/presentation/screen/register_screen.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/request/login_request.dart';
import '../screen/../state_m/provider/login_screen_notifier.dart';
import 'forgot_password_screen.dart';
import 'general_auth_screen.dart';

class LoginScreenContent extends StatefulWidget {
  const LoginScreenContent({super.key});

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  late LoginScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<LoginScreenNotifier>(context);
    sn.context = context;
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: _build(),
    );
  }

  Widget _build() {
    return GeneralAuthScreen(
      appBar: TransparentAppBar(
        title: Translation.of(context).login,
      ),
      buttonText: Translation.of(context).login,
      additionalText: Translation.of(context).no_account,
      additionalTapText: Translation.of(context).signup2,
      isloading: sn.isLoading,
      onButtonTap: _login,
      onAdditionalTextTapped: _offToSignupScreen,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: sn.formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 0.16.sh,
              ),
              PhoneNumberTextField(
                onDialChanged: (d) {},
                onInputChanged: (code) => sn.countryCode = code,
                textEditingController: sn.phoneController,
                isoCode: sn.countryCode,
                focusNode: sn.phoneFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: () {
                  FocusScope.of(context).requestFocus(sn.passwordFocusNode);
                },
              ),
              Gaps.vGap8,
              PasswordTextField(
                controller: sn.passwordController,
                passwordSecure: sn.passwordSecure,
                textInputAction: TextInputAction.done,
                onFiledSubmitted: () {
                  _login();
                },
                focusNode: sn.passwordFocusNode,
                hidePassword: (bool) {
                  setState(() {
                    sn.passwordSecure = bool;
                  });
                },
              ),
              Gaps.vGap14,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _toForgotPassword,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: CustomText(
                        text: Translation.of(context).forgot_password,
                        color: AppColors.accentColorLight,
                        fontSize: AppConstants.textSize14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  /* _unFocus() {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }*/

  void _login() {
    if (sn.formKey.currentState!.validate()) {
      sn.accountCubit.login(LoginRequest(
        userNameOrEmailAddress: sn.phoneController.text,
        password: sn.passwordController.text,
        rememberClient: true,
      ));
      // sn.accountCubit.verifyAccount(VerifyAccountRequest(
      //     usernameOrEmailOrPhone: sn.phoneController.text, code: "000000"));
    }
  }

  void _offToSignupScreen() {
    Nav.off(RegisterScreen.routeName, cleanHistory: true, context: context);
  }

  void _toForgotPassword() {
    Nav.to(ForgotPasswordScreen.routeName, context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
