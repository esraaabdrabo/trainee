import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../data/model/request/send_verification_code_request.dart';
import '../bloc/account_cubit.dart';

class AccountVerificationScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  AccountCubit _accountCubit = AccountCubit();
  AccountCubit _verificationCodeCubit = AccountCubit();
  bool _isLoading = false;
  TextEditingController _pinCodeController = TextEditingController();
  late String _phoneNumber;
  late String _otpValue;
  GlobalKey<FormState> _formKey = GlobalKey();

  /// Getters and Setters
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;

    notifyListeners();
  }

  AccountCubit get accountCubit => _accountCubit;

  TextEditingController get pinCodeController => _pinCodeController;


  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    debugPrint("ph:$value");
    _phoneNumber = value;
    notifyListeners();
  }
  String get otpValue => _otpValue;

  set otpValue(String value) {
    debugPrint("ph:$value");
    _otpValue = value;
    notifyListeners();
  }
  GlobalKey<FormState> get formKey => _formKey;

  /// Methods

  void sendVC() {
    _verificationCodeCubit.sendVC(SendVerificationCodeRequest(
      phoneNumber: phoneNumber,
      userType: 0,
    ));
  }

  void resendVC() {
    _accountCubit.sendVC(SendVerificationCodeRequest(
      phoneNumber: phoneNumber,
      userType: 0,
    ));
  }


  @override
  void closeNotifier() {
    pinCodeController.dispose();
    accountCubit.close();
    dispose();
  }
}
