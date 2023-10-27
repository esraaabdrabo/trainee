import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../bloc/account_cubit.dart';

class ChangePasswordScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  AccountCubit _accountCubit = AccountCubit();
  bool _isLoading = false;
  bool _oldPasswordSecure = true;
  bool _newPasswordSecure = true;
  bool _confirmNewPasswordSecure = true;
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();
  FocusNode _oldPasswordFocusNode = FocusNode();
  FocusNode _newPasswordFocusNode = FocusNode();
  FocusNode _confirmNewPasswordFocusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey();

  /// Getters and Setters

  AccountCubit get accountCubit => _accountCubit;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get oldPasswordController => _oldPasswordController;

  TextEditingController get newPasswordController => _newPasswordController;

  TextEditingController get confirmNewPasswordController =>
      _confirmNewPasswordController;

  FocusNode get oldPasswordFocusNode => _oldPasswordFocusNode;

  FocusNode get newPasswordFocusNode => _newPasswordFocusNode;

  FocusNode get confirmNewPasswordFocusNode => _confirmNewPasswordFocusNode;

  bool get oldPasswordSecure => _oldPasswordSecure;

  set oldPasswordSecure(bool value) {
    _oldPasswordSecure = value;
  }

  bool get newPasswordSecure => _newPasswordSecure;

  set newPasswordSecure(bool value) {
    _newPasswordSecure = value;
  }

  bool get confirmNewPasswordSecure => _confirmNewPasswordSecure;

  set confirmNewPasswordSecure(bool value) {
    _confirmNewPasswordSecure = value;
  }

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
