import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/params/screen_params/create_new_password_screen_params.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/account_verification_screen_notifier.dart';
import '../state_m/bloc/account_cubit.dart';
import '../state_m/provider/register_screen_notifier.dart';
import 'account_verification_screen_content.dart';
import 'create_new_password_screen.dart';

class AccountVerificationScreen extends StatefulWidget {
  static const String routeName = "/AccountVerificationScreen";
  final Function onVerify;
  final bool isCreateNewPassword;
  final String phoneNumber;

  const AccountVerificationScreen(
      {Key? key,
      required this.onVerify,
      required this.phoneNumber,
      this.isCreateNewPassword = false})
      : super(key: key);

  @override
  _AccountVerificationScreenState createState() =>
      _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
  final sn = AccountVerificationScreenNotifier();
  final sn2 = RegisterScreenNotifier();

  @override
  void initState() {
    super.initState();

    sn.phoneNumber = widget.phoneNumber;
    sn.sendVC();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AccountVerificationScreenNotifier>.value(
          value: sn,
        ),
        ChangeNotifierProvider<RegisterScreenNotifier>.value(
          value: sn2,
        ),
      ],
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
                verifyAccountLoaded: (registerEntity) {
                  setState(() {
                    sn.isLoading = false;
                  });
                  if (!widget.isCreateNewPassword)
                    widget.onVerify();
                  else
                    _toNewPasswordScreen();
                },
                sendVCLoaded: (acknowledgeEntity) {
                  ErrorViewer.showError(
                      context: context,
                      error: CustomError(
                          message:
                              Translation.of(context).verification_code_sent),
                      callback: () {});
                },
              );
            },
            child: const AccountVerificationScreenContent()),
      ),
    );
  }

  void _toNewPasswordScreen() {
    Nav.off(CreateNewPasswordScreen.routeName,
        arguments: CreateNewPasswordScreenParams(
            phone: widget.phoneNumber,),context: context);
  }
}
