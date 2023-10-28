import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../data/model/request/send_verification_code_request.dart';
import '../bloc/account_cubit.dart';

class RegisterScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  final AccountCubit _accountCubit = AccountCubit();
  bool _isLoading = false;
  bool _passwordSecure = true;
  bool _confirmPasswordSecure = true;
  bool _boxChecked = true;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _countryCode = AppConstants.DEFAULT_COUNTRY_CODE;
  late String _countryDial = AppConstants.DEFAULT_COUNTRY_DIAL;
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  ///TODO: edit on verification message:
  late String verificationId;
  FirebaseAuth auth = FirebaseAuth.instance;

  void verificationCompleted(PhoneAuthCredential credential) async {
    debugPrint("${credential.smsCode}");
    debugPrint("creadintial complated");
    await auth.signInWithCredential(credential);
  }

  void verificationFailed(FirebaseAuthException e) {
    debugPrint("Error in verification");
    notifyListeners();
  }

  Future<void> submitPhoneNumber({newPhone}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: newPhone ?? "+2001011153207",
      timeout: const Duration(seconds: 120),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeRetrivalTimeOut,
    );
    notifyListeners();
  }

  bool countState = false;

  codeSent(String verificationId, int? resendToken) {
    this.verificationId = verificationId;
    countState = true;
    notifyListeners();
  }

  void codeRetrivalTimeOut(String verificationId) {
    debugPrint("code Auto rerival Time");
  }

  Future<void> submitOTP(String otp) async {
    debugPrint(otp);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);

    await SmsSignIn(credential);
    notifyListeners();
  }

  Future<void> SmsSignIn(PhoneAuthCredential credential) async {
    try {
      await auth.signInWithCredential(credential);
      notifyListeners();
    } catch (error) {
      notifyListeners();
    }
  }

  ///

  /// Getters and Setters

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get passwordSecure => _passwordSecure;

  set passwordSecure(bool value) {
    _passwordSecure = value;
    notifyListeners();
  }

  AccountCubit get accountCubit => _accountCubit;

  TextEditingController get passwordController => _passwordController;

  bool get confirmPasswordSecure => _confirmPasswordSecure;

  set confirmPasswordSecure(bool value) {
    _confirmPasswordSecure = value;
    notifyListeners();
  }

  TextEditingController get phoneController => _phoneController;

  bool get boxChecked => _boxChecked;

  set boxChecked(bool value) {
    _boxChecked = value;
    notifyListeners();
  }

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  GlobalKey<FormState> get formKey => _formKey;

  String get countryCode => _countryCode;

  set countryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  String get countryDial => _countryDial;

  set countryDial(String value) {
    _countryDial = value;
    notifyListeners();
  }

  void sendVC() {
    accountCubit.sendVC(SendVerificationCodeRequest(
      phoneNumber: _phoneController.text,
      userType: 0,
    ));
  }

  FocusNode get phoneFocusNode => _phoneFocusNode;

  FocusNode get passwordFocusNode => _passwordFocusNode;

  FocusNode get confirmPasswordFocusNode => _confirmPasswordFocusNode;

  /// Methods

  @override
  void closeNotifier() {
    accountCubit.close();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    dispose();
  }
}
