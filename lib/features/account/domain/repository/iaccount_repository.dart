
import '../../../../core/entities/acknowledge_entity.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/model/request/change_password_request.dart';
import '../../data/model/request/create_new_password_request.dart';
import '../../data/model/request/forgot_password_request.dart';
import '../../data/model/request/login_request.dart';
import '../../data/model/request/register_request.dart';
import '../../data/model/request/send_verification_code_request.dart';
import '../../data/model/request/verify_account_request.dart';
import '../entity/login_entity.dart';
import '../entity/register_entity.dart';

abstract class IAccountRepository extends Repository {
  Future<Result<AppErrors, LoginEntity>> login(LoginRequest loginRequest);

  Future<Result<AppErrors, RegisterEntity>> register(
      RegisterRequest registerRequest);
  Future<Result<AppErrors, AcknowledgeEntity>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest);
  Future<Result<AppErrors, AcknowledgeEntity>> createNewPassword(
      CreateNewPasswordRequest createNewPasswordRequest);
  Future<Result<AppErrors, AcknowledgeEntity>> verifyAccount(
      VerifyAccountRequest verifyAccountRequest);
  Future<Result<AppErrors, AcknowledgeEntity>> sendVC(
      SendVerificationCodeRequest sendVerificationCodeRequest);

  Future<Result<AppErrors, AcknowledgeEntity>> changePassword(
      ChangePasswordRequest params);
}
