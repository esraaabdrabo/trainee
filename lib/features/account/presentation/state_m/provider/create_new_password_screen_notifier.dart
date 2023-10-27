import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../bloc/account_cubit.dart';

class CreateNewPasswordScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  final AccountCubit _accountCubit = AccountCubit();
  bool _isLoading = false;
  bool _passwordSecure = true;
  bool _confirmPasswordSecure = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();
  late String _phone;
  late String _code;

  /// Getters and Setters

  AccountCubit get accountCubit => _accountCubit;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  FocusNode get passwordFocusNode => _passwordFocusNode;

  FocusNode get confirmPasswordFocusNode => _confirmPasswordFocusNode;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  GlobalKey<FormState> get formKey => _formKey;

  bool get passwordSecure => _passwordSecure;

  set passwordSecure(bool value) {
    _passwordSecure = value;
  }

  bool get confirmPasswordSecure => _confirmPasswordSecure;

  set confirmPasswordSecure(bool value) {
    _confirmPasswordSecure = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }

  // String get code => _code;
  //
  // set code(String value) {
  //   _code = value;
  // }
}
