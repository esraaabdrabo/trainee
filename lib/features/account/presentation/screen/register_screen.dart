import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/params/screen_params/account_verification_screen_params.dart';
import 'package:upgrade_traine_project/features/account/presentation/screen/account_verification_screen.dart';
import 'package:upgrade_traine_project/main.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/dialogs/custom_dialogs.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/register_screen_notifier.dart';
import '../state_m/bloc/account_cubit.dart';
import 'login_screen.dart';
import 'register_screen_content.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/RegisterScreen";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final sn = RegisterScreenNotifier();

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
    return ChangeNotifierProvider<RegisterScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocListener<AccountCubit, AccountState>(
            bloc: sn.accountCubit,
            listener: (context, state) {
              state.whenOrNull(accountLoading: () {
                setState(() {
                  sn.isLoading = true;
                });
              }, accountError: (error, callback) {
                setState(() {
                  sn.isLoading = false;
                });
                ErrorViewer.showError(
                    context: context, error: error, callback: callback);
              }, registerLoaded: (registerEntity) {
                setState(() {
                  sn.isLoading = false;
                });
                _navigationToAccountVerification();
              }, verifyAccountLoaded: (registerEntity) {
                setState(() {
                  sn.isLoading = false;
                });
                _onVerify();
              });
            },
            child: const RegisterScreenContent()),
      ),
    );
  }

  void _navigationToAccountVerification() {
    Nav.off(AccountVerificationScreen.routeName,
        context: context,
        arguments: AccountVerificationScreenParams(
            isCreateNewPassword: false,
            onVerification: () => Nav.off(LoginScreen.routeName,
                cleanHistory: true,
                context: navigatorKey.currentState!.context),
            phone: sn.phoneController.text));
  }

  void _onVerify() {
    Nav.off(LoginScreen.routeName, cleanHistory: true, arguments: (context2) {
      showNewMessageDialog(
          context: context2,
          title: Translation.of(context2).account_created_successfully);
    }, context: context);
  }
}
