import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/params/screen_params/account_verification_screen_params.dart';
import 'package:upgrade_traine_project/features/account/presentation/screen/account_verification_screen.dart';

import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../screen/../state_m/provider/forgot_password_screen_notifier.dart';
import '../state_m/bloc/account_cubit.dart';
import 'forgot_password_screen_content.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "/ForgotPasswordScreen";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final sn = ForgotPasswordScreenNotifier();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordScreenNotifier>.value(
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
                  ErrorViewer.showError(
                      context: context, error: error, callback: callback);
                },
                forgotPasswordLoaded: (forgotPasswordEntity) {
                  setState(() {
                    sn.isLoading = false;
                  });
                  Nav.to(AccountVerificationScreen.routeName,
                      arguments: AccountVerificationScreenParams(
                          onVerification: () {},
                          isCreateNewPassword: true,
                          phone: sn.phoneController.text),
                      context: context);
                },
              );
            },
            child: ForgotPasswordScreenContent()),
      ),
    );
  }
}
