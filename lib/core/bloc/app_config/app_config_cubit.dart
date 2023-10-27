import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../features/account/presentation/screen/login_screen.dart';
import '../../common/app_config.dart';
import '../../models/profile.dart';

part 'app_config_state.dart';

/// App config methods goes here
/// Like methods related to app behaviour
class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(AppConfigState.initialState);

  Future<AppConfigState> applicationStarted() async {
    final profile = await _getUserProfile();
    return state.copyWith(
          isApplicationStarted: true,
          profile: profile,
        );
  }

  Future<AppConfigState> userLogout({required context}) async {
    AppConfig().deleteToken();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(
      LoginScreen.routeName,
      (Route<dynamic> route) => false,
    );

    return state.clearProfile();
  }

  Future<AppConfigState> setUserProfile() async {
    return state.copyWith(
          profile: Profile(
            phoneConfirmed: false,
            name: "Issa",
          ),
        );
  }

  Future<AppConfigState> verifyUserAccount() async {
    final profile = Profile(phoneConfirmed: false, name: "Issa");
    final newProfile = profile.copyWith(phoneConfirmed: true);
    return state.copyWith(profile: newProfile);
  }

  Future<Profile?> _getUserProfile() async {
    if (!await AppConfig().hasToken) return null;

    return Profile(phoneConfirmed: true);
  }
}
