class AccountVerificationScreenParams {
  final Function onVerification;
  final String phone;
  final bool isCreateNewPassword;
  AccountVerificationScreenParams(
      {required this.onVerification,
      required this.phone,
      this.isCreateNewPassword = false});
}
