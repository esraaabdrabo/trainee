import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/entities/acknowledge_entity.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/acknowledge_model.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/login_entity.dart';
import '../../domain/entity/register_entity.dart';
import '../../domain/repository/iaccount_repository.dart';
import '../datasources/iaccount_remote.dart';
import '../model/request/change_password_request.dart';
import '../model/request/create_new_password_request.dart';
import '../model/request/forgot_password_request.dart';
import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/request/send_verification_code_request.dart';
import '../model/request/verify_account_request.dart';
import '../model/response/login_model.dart';
import '../model/response/register_model.dart';

@Injectable(as: IAccountRepository)
class AccountRepository extends IAccountRepository {
  final IAccountRemoteSource iAccountRemoteSource;

  AccountRepository(this.iAccountRemoteSource);

  @override
  Future<Result<AppErrors, LoginEntity>> login(
      LoginRequest loginRequest) async {
    final remote = await iAccountRemoteSource.login(loginRequest);
    return execute<LoginModel, LoginEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, RegisterEntity>> register(
    RegisterRequest registerRequest,
  ) async {
    final remote = await iAccountRemoteSource.register(registerRequest);
    debugPrint("${remote}");
    return execute<RegisterModel, RegisterEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    final remote =
        await iAccountRemoteSource.forgotPassword(forgotPasswordRequest);
    return execute<AcknowledgeModel, AcknowledgeEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> createNewPassword(
      CreateNewPasswordRequest createNewPasswordRequest) async {
    final remote =
        await iAccountRemoteSource.createNewPassword(createNewPasswordRequest);
    return execute<AcknowledgeModel, AcknowledgeEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> verifyAccount(
      VerifyAccountRequest verifyAccountRequest) async {
    final remote =
        await iAccountRemoteSource.verifyAccount(verifyAccountRequest);
    return execute<AcknowledgeModel, AcknowledgeEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> sendVC(
      SendVerificationCodeRequest sendVerificationCodeRequest) async {
    final remote =
        await iAccountRemoteSource.sendVC(sendVerificationCodeRequest);
    return execute<AcknowledgeModel, AcknowledgeEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> changePassword(
      ChangePasswordRequest params) async {
    final remote = await iAccountRemoteSource.changePassword(params);
    return execute<AcknowledgeModel, AcknowledgeEntity>(remoteResult: remote);
  }
}
