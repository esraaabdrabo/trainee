import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/datasources/shared_preference.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/dialogs/custom_dialogs.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/change_password_screen_notifier.dart';
import '../state_m/bloc/account_cubit.dart';
import 'change_password_screen_content.dart';
import 'login_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = "/ChangePasswordScreen";

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final sn = ChangePasswordScreenNotifier();

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
    return ChangeNotifierProvider<ChangePasswordScreenNotifier>.value(
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
                changePasswordLoaded: (changePasswordLoaded) async {
                  setState(() {
                    sn.isLoading = false;
                  });
                  final pref = await SpUtil.getInstance();
                  showNewMessageDialog(
                      context: context,
                      title: Translation.of(context).password_changed,
                      onPressed: () {
                        pref.clear();
                        Nav.off(LoginScreen.routeName, cleanHistory: true,context: context);
                      });
                },
              );
            },
            child: ChangePasswordScreenContent()),
      ),
    );
  }
}
