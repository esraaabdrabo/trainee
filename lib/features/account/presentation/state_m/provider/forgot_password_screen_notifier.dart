import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../data/model/request/send_verification_code_request.dart';
import '../bloc/account_cubit.dart';

class ForgotPasswordScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  AccountCubit _accountCubit = AccountCubit();
  bool _isLoading = false;
  TextEditingController _phoneController = TextEditingController();
  FocusNode _phoneFocusNode = FocusNode();
  late String _countryCode = AppConstants.DEFAULT_COUNTRY_CODE;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Getters and Setters
  AccountCubit get accountCubit => _accountCubit;

  TextEditingController get phoneController => _phoneController;

  FocusNode get phoneFocusNode => _phoneFocusNode;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String get countryCode => _countryCode;

  set countryCode(String value) {
    _countryCode = value;
  }

  void sendVC() {
    accountCubit.sendVC(SendVerificationCodeRequest(
      phoneNumber: _phoneController.text,
      userType: 0,
    ));
  }

  GlobalKey<FormState> get formKey => _formKey;

  /// Methods

  @override
  void closeNotifier() {
    accountCubit.close();
    phoneController.dispose();
    phoneFocusNode.dispose();
    this.dispose();
  }
}
