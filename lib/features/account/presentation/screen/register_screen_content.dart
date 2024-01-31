import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/more_screen/privacy_policy/privacy_policy_screen.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../core/ui/widgets/custom_checkBox.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/request/register_request.dart';
import '../screen/../state_m/provider/register_screen_notifier.dart';
import 'general_auth_screen.dart';
import 'login_screen.dart';

class RegisterScreenContent extends StatefulWidget {
  const RegisterScreenContent({super.key});

  @override
  State<RegisterScreenContent> createState() => _RegisterScreenContentState();
}

class _RegisterScreenContentState extends State<RegisterScreenContent> {
  late RegisterScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<RegisterScreenNotifier>(context);
    sn.context = context;
    return _buildScreen();
  }

  _buildScreen() {
    return GeneralAuthScreen(
      additionalText: Translation.of(context).account_exist,
      onButtonTap: _signup,
      additionalTapText: Translation.of(context).login2,
      buttonText: Translation.of(context).signUp,
      isloading: sn.isLoading,
      appBar: TransparentAppBar(
        title: Translation.of(context).signUp,
      ),
      onAdditionalTextTapped: _offToLoginScreen,
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
                onInputChanged: (code) => sn.countryCode = code,
                onDialChanged: (dial) => sn.countryDial = dial,
                textEditingController: sn.phoneController,
                isoCode: sn.countryCode,
                focusNode: sn.phoneFocusNode,
                onFieldSubmitted: () {
                  FocusScope.of(context).requestFocus(sn.passwordFocusNode);
                },
              ),
              Gaps.vGap8,
              PasswordTextField(
                controller: sn.passwordController,
                passwordSecure: sn.passwordSecure,
                textInputAction: TextInputAction.next,
                focusNode: sn.passwordFocusNode,
                onFiledSubmitted: () {
                  FocusScope.of(context)
                      .requestFocus(sn.confirmPasswordFocusNode);
                },
                hidePassword: (bool) {
                  setState(() {
                    sn.passwordSecure = bool;
                  });
                },
              ),
              Gaps.vGap8,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: Translation.of(context).accept_on,
                  ),
                  Gaps.hGap4,
                  InkWell(
                    onTap: () {
                      Nav.to(PrivacyPolicyScreen.routeName, context: context);
                    },
                    child: CustomText(
                      text: Translation.of(context).terms,
                      color: AppColors.accentColorLight,
                      fontSize: AppConstants.textSize14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.hGap4,
                  CustomText(
                    text: Translation.of(context).following,
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 1.5,
                    child: CustomCheckbox(
                      checkColor: AppColors.white,
                      activeColor: AppColors.accentColorLight,
                      value: sn.boxChecked,
                      onChanged: (value) => setState(() {
                        sn.boxChecked = value!;
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  unFocus() {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  _signup() {
    unFocus();
    if (sn.formKey.currentState!.validate()) {
      if (sn.boxChecked) {
        sn.accountCubit.register(RegisterRequest(
          phoneNumber: sn.phoneController.text,
          countryCode: sn.countryCode,
          password: sn.passwordController.text,
        ));
        debugPrint("${sn.countryDial}${sn.phoneController.text}");
        // sn.submitPhoneNumber(
        //     newPhone: "${sn.countryDial}${sn.phoneController.text}");
      } else {
        ErrorViewer.showError(
            errorViewerOptions:
                const ErrVSnackBarOptions(backgroundColor: AppColors.grey),
            context: context,
            error: CustomError(
                message: Translation.of(context).accept_terms_conditions),
            callback: () {});
      }
    }
  }

  _offToLoginScreen() {
    Nav.off(LoginScreen.routeName, cleanHistory: true, context: context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
