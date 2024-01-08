import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/acknowledge_model.dart';
import '../../../../core/net/api_url.dart';
import '../model/request/change_password_request.dart';
import '../model/request/create_new_password_request.dart';
import '../model/request/forgot_password_request.dart';
import '../model/request/login_request.dart';
import '../model/request/register_request.dart';
import '../model/request/send_verification_code_request.dart';
import '../model/request/verify_account_request.dart';
import '../model/response/login_model.dart';
import '../model/response/register_model.dart';
import 'iaccount_remote.dart';

@Injectable(as: IAccountRemoteSource)
class AccountRemoteSource extends IAccountRemoteSource {
  @override
  Future<Either<AppErrors, LoginModel>> login(LoginRequest loginRequest) async {
    return await request<LoginModel>(
      converter: (json) => LoginModel.fromMap(json),
      method: HttpMethod.POST,
      url: APIUrls.API_LOGIN,
      body: loginRequest.toMap(),
      cancelToken: loginRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    return await request<RegisterModel>(
      converter: (json) => RegisterModel.fromJson(json),
      method: HttpMethod.POST,
      url: APIUrls.API_REGISTER,
      body: registerRequest.toMap(),
      cancelToken: registerRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, AcknowledgeModel>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    return await request<AcknowledgeModel>(
      converter: (json) => AcknowledgeModel.fromJson(json),
      method: HttpMethod.POST,
      url: APIUrls.API_FORGOT_PASSWORD,
      body: forgotPasswordRequest.toMap(),
      cancelToken: forgotPasswordRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, AcknowledgeModel>> createNewPassword(
      CreateNewPasswordRequest changePasswordRequest) async {
    return await request<AcknowledgeModel>(
      converter: (json) => AcknowledgeModel.fromJson(json),
      method: HttpMethod.POST,
      url: APIUrls.API_CREATE_NEW_PASSWORD,
      body: changePasswordRequest.toMap(),
      cancelToken: changePasswordRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, AcknowledgeModel>> verifyAccount(
      VerifyAccountRequest verifyAccountRequest) async {
    return await request<AcknowledgeModel>(
      converter: (json) => AcknowledgeModel.fromJson(json),
      method: HttpMethod.POST,
      url: APIUrls.API_VERIFY_ACCOUNT,
      body: verifyAccountRequest.toMap(),
      cancelToken: verifyAccountRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, AcknowledgeModel>> sendVC(
      SendVerificationCodeRequest sendVerificationCodeRequest) async {
    return await request<AcknowledgeModel>(
      converter: (json) => AcknowledgeModel.fromJson(json),
      method: HttpMethod.POST,
      url: APIUrls.API_SEND_VC,
      body: sendVerificationCodeRequest.toMap(),
      cancelToken: sendVerificationCodeRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, AcknowledgeModel>> changePassword(
      ChangePasswordRequest params) async {
    return await request<AcknowledgeModel>(
      converter: (json) => AcknowledgeModel.fromJson(json),
      method: HttpMethod.POST,
      url: APIUrls.API_CHANGE_PASSWORD,
      body: params.toMap(),
      // headers: getIt<HttpClient>().instance.options.headers.map((key, value) => value),
      cancelToken: params.cancelToken,
    );
  }
}
