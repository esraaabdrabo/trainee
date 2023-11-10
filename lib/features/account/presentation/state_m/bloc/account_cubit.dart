import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upgrade_traine_project/core/net/api_url.dart';

import '../../../../../core/dioHelper/dio_helper.dart';
import '../../../../../core/entities/acknowledge_entity.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/change_password_request.dart';
import '../../../data/model/request/create_new_password_request.dart';
import '../../../data/model/request/forgot_password_request.dart';
import '../../../data/model/request/login_request.dart';
import '../../../data/model/request/register_request.dart';
import '../../../data/model/request/send_verification_code_request.dart';
import '../../../data/model/request/verify_account_request.dart';
import '../../../domain/entity/login_entity.dart';
import '../../../domain/entity/register_entity.dart';
import '../../../domain/usecase/change_password_usecase.dart';
import '../../../domain/usecase/create_new_password_usecase.dart';
import '../../../domain/usecase/forgot_password_usecase.dart';
import '../../../domain/usecase/login_usecase.dart';
import '../../../domain/usecase/register_usecase.dart';
import '../../../domain/usecase/send_vc_usecase.dart';
import '../../../domain/usecase/verify_account_usecase.dart';

part 'account_cubit.freezed.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState.accountInit());

  void login(LoginRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<LoginUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.loginLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => login(body)));
      },
    );
  }

  void register(RegisterRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<RegisterUseCase>()(body);
    print(body.toMap());
    result.pick(
      onData: (data) {
        emit(AccountState.registerLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => register(body)));
      },
    );
  }

  void forgotPassword(ForgotPasswordRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<ForgotPasswordUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.forgotPasswordLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => forgotPassword(body)));
      },
    );
  }

  void changePassword(ChangePasswordRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<ChangePasswordUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.changePasswordLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => changePassword(body)));
      },
    );
  }

  void createNewPassword(CreateNewPasswordRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<CreateNewPasswordUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.createNewPasswordLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => createNewPassword(body)));
      },
    );
  }

  void verifyAccount(VerifyAccountRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<VerifyAccountUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.verifyAccountLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => verifyAccount(body)));
      },
    );
  }

  void sendVC(SendVerificationCodeRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<SendVCUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.sendVCLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => sendVC(body)));
      },
    );
  }

  Future<void> updateDeviceToken() async {
    log("message");
    var token = await FirebaseMessaging.instance.getToken();
    print("fcm token : $token");
    final result = await DioHelper.put(APIUrls.API_UPDATE_DEVICE_TOKEN,
        body: {"token": token ?? ""});

    print(result.data);
  }
}
