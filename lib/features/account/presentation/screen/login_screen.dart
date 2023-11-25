import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/error_ui/error_viewer/errv_options.dart';
import 'package:upgrade_traine_project/core/ui/error_ui/error_viewer/snack_bar/errv_snack_bar_options.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/datasources/shared_preference.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/params/screen_params/account_verification_screen_params.dart';
import '../../../../core/ui/dialogs/custom_dialogs.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/screen/navigator_screen.dart';
import '../screen/../state_m/provider/login_screen_notifier.dart';
import '../state_m/bloc/account_cubit.dart';
import 'account_verification_screen.dart';
import 'login_screen_content.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";
  final Function(BuildContext)? executeOnInit;

  const LoginScreen({Key? key, this.executeOnInit}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final sn = LoginScreenNotifier();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.executeOnInit != null) widget.executeOnInit!(context);
    });

    _initSharedPref();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  void _initSharedPref() async {
    var prefs = await SpUtil.getInstance();
    String? phone = await prefs.getString(AppConstants.KEY_PHONE);
    if (phone != null) sn.setPhoneNumber(phone);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocListener<AccountCubit, AccountState>(
            bloc: sn.accountCubit,
            listener: (context, state) {
              state.whenOrNull(
                accountLoading: () {
                  setState(() {
                    sn.isLoading = true;
                  });
                },
                accountError: (error, callback) {
                  setState(() {
                    sn.isLoading = false;
                  });
                  // Nav.off(NavigatorScreen.routeName, cleanHistory: true);
                  if (error is InternalServerWithDataError) {
                    if (error.errorCode == 4) {
                      _navigationToAccountVerification();
                    } else if (error.errorCode == 3) {
                      ErrorViewer.showCustomError(
                        context,
                        LanguageHelper.tr(context).invalid_credintials,
                        errorViewerOptions: const ErrVSnackBarOptions(
                            backgroundColor: AppColors.red),
                      );
                    }
                  } else {
                    ErrorViewer.showError(
                        context: context, error: error, callback: callback);
                  }
                },
                loginLoaded: (loginEntity) async {
                  setState(() {
                    sn.isLoading = false;
                  });
                  var prefs = await SpUtil.getInstance();
                  prefs.putString(
                      AppConstants.KEY_TOKEN, loginEntity.accessToken ?? '');
                  prefs.putString(AppConstants.KEY_ENCRYPTED_TOKEN,
                      loginEntity.encryptedAccessToken ?? '');
                  //  prefs.putString(
                  //      AppConstants.KEY_PHONE, sn.phoneController.text);
                  await sn.accountCubit.updateDeviceToken();
                  Nav.off(NavigatorScreen.routeName,
                      cleanHistory: true, context: context);
                  debugPrint("login loaded");
                },
              );
            },
            child: LoginScreenContent()),
      ),
    );
  }

  void _navigationToAccountVerification() {
    Nav.to(AccountVerificationScreen.routeName,
        arguments: AccountVerificationScreenParams(
            onVerification: _onVerify, phone: sn.phoneController.text),
        context: context);
  }

  void _onVerify() {
    Nav.off(LoginScreen.routeName, context: context, cleanHistory: true,
        arguments: (context2) {
      showNewMessageDialog(
          context: context2,
          title: Translation.of(context2).account_verified_successfully);
    });
  }
}
