import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../bloc/account_cubit.dart';

class LoginScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  AccountCubit _accountCubit = AccountCubit();
  bool _isLoading = false;
  bool _passwordSecure = true;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late String _countryCode = AppConstants.DEFAULT_COUNTRY_CODE;
  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Getters and Setters
  AccountCubit get accountCubit => _accountCubit;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  bool get passwordSecure => _passwordSecure;

  set passwordSecure(bool value) {
    _passwordSecure = value;
  }

  TextEditingController get phoneController => _phoneController;

  void setPhoneNumber(String number) {
    phoneController.text = number;
    notifyListeners();
  }

  TextEditingController get passwordController => _passwordController;

  String get countryCode => _countryCode;

  set countryCode(String value) {
    _countryCode = value;
  }

  FocusNode get phoneFocusNode => _phoneFocusNode;

  FocusNode get passwordFocusNode => _passwordFocusNode;

  GlobalKey<FormState> get formKey => _formKey;

  /// Methods

  @override
  void closeNotifier() {
    accountCubit.close();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    phoneController.dispose();
    passwordController.dispose();
    this.dispose();
  }
}
