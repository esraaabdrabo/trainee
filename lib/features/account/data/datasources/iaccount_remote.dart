import 'package:dartz/dartz.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/acknowledge_model.dart';
import '../model/request/change_password_request.dart';
import '../model/request/create_new_password_request.dart';
import '../model/request/forgot_password_request.dart';
import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/request/send_verification_code_request.dart';
import '../model/request/verify_account_request.dart';
import '../model/response/login_model.dart';
import '../model/response/register_model.dart';

abstract class IAccountRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, LoginModel>> login(LoginRequest loginRequest);

  Future<Either<AppErrors, RegisterModel>> register(
      RegisterRequest registerRequest);
  Future<Either<AppErrors, AcknowledgeModel>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest);
  Future<Either<AppErrors, AcknowledgeModel>> createNewPassword(
      CreateNewPasswordRequest createNewPasswordRequest);
  Future<Either<AppErrors, AcknowledgeModel>> verifyAccount(
      VerifyAccountRequest verifyAccountRequest);
  Future<Either<AppErrors, AcknowledgeModel>> sendVC(
      SendVerificationCodeRequest sendVerificationCodeRequest);

  Future<Either<AppErrors, AcknowledgeModel>> changePassword(
      ChangePasswordRequest params);
}
