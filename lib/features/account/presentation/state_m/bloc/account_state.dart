part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.accountInit() = AccountInit;
  const factory AccountState.accountLoading() = AccountLoading;
  const factory AccountState.loginLoaded(LoginEntity loginEntity) =
      AccLoginLoaded;
  const factory AccountState.registerLoaded(RegisterEntity registerEntity) =
      AccRegisterLoaded;
  const factory AccountState.forgotPasswordLoaded(
      AcknowledgeEntity acknowledgeEntity) = AccForgotPassLoaded;
  const factory AccountState.createNewPasswordLoaded(
      AcknowledgeEntity acknowledgeEntity) = AccCreateNewPassLoaded;
  const factory AccountState.verifyAccountLoaded(
      AcknowledgeEntity acknowledgeEntity) = AccVerifyAccountLoaded;
  const factory AccountState.sendVCLoaded(AcknowledgeEntity acknowledgeEntity) =
      AccSendVCAccountLoaded;
  const factory AccountState.accountError(
      AppErrors error, VoidCallback callback) = AccountError;
  const factory AccountState.changePasswordLoaded(
      AcknowledgeEntity acknowledgeEntity) = AccChangePassLoaded;
}
