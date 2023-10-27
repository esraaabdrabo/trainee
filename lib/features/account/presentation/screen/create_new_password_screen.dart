import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/dialogs/custom_dialogs.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/create_new_password_screen_notifier.dart';
import '../state_m/bloc/account_cubit.dart';
import 'create_new_password_screen_content.dart';
import 'login_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  static const String routeName = "/CreateNewPasswordScreen";
   final String phone;
  // final String code;

  const CreateNewPasswordScreen(
      {Key? key, required this.phone,
        // required this.phone, required this.code
      })
      : super(key: key);

  @override
  _CreateNewPasswordScreenState createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final sn = CreateNewPasswordScreenNotifier();

  @override
  void initState() {
    super.initState();
     sn.phone = widget.phone;
    // sn.code = widget.code;
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateNewPasswordScreenNotifier>.value(
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
                createNewPasswordLoaded: (ackEntity) {
                  setState(() {
                    sn.isLoading = false;
                  });
                  Nav.off(LoginScreen.routeName, cleanHistory: true,
                      context: context,
                      arguments: (context2) {
                    showNewMessageDialog(
                        context: context2,
                        title: Translation.of(context2)
                            .password_changed_successfully);
                  });
                },
              );
            },
            child: CreateNewPasswordScreenContent()),
      ),
    );
  }
}
