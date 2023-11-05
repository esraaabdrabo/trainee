import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upgrade_traine_project/features/profile/data/model/request/update_profile_model.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/datasources/shared_preference.dart';
import '../../../../../core/models/courses_model.dart';
import '../../../../../core/models/profile_model.dart';
import '../../../../../core/net/api_url.dart';
import '../../../../../core/network/dioHelper.dart';
import '../../../data/model/response/trainers_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileIntial());

  ProfileModel? profileModel;

  void getToken() async {
    var prefs = await SpUtil.getInstance();
    if (prefs.getString(AppConstants.KEY_TOKEN) != null) {
      onUserLogin();
    }
  }

  /// on App's user login
  void onUserLogin() {
    /// 1.2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ///
  }

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final response = await DioHelper().getData(url: APIUrls.API_GET_PROFILE);
    response.fold((error) {
      emit(ProfileError());
    }, (success) {
      profileModel = ProfileModel.fromJson(success.data);
      getToken();
      emit(ProfileSuccess(profileModel: ProfileModel.fromJson(success.data)));
    });
  }

  Future<void> getTrainers() async {
    emit(GetTrainersLoading());
    final response = await DioHelper().getData(url: APIUrls.API_GET_TRAINERS);
    print("-------------------------------------- $response");
    response.fold((error) {
      emit(GetTrainersError());
    }, (success) {
      print(success.data);
      emit(GetTrainersSuccess(
          trainersModel: TrainersModel.fromJson(success.data)));
    });
  }

  Future<void> getUserFinishedCourses() async {
    emit(FinishedCoursesLoading());
    final response = await DioHelper().getData(
        url: APIUrls.API_GET_COURSES,
        query: {"IsFinished": "true", "IncludeOnlyMyCourses": "true"});
    response.fold((error) {
      emit(FinishedCoursesError());
    }, (success) {
      emit(
        FinishedCoursesSuccess(
          finishedCoursesModel: CoursesModel.fromJson(success.data),
        ),
      );
    });
  }

  Future<void> getUsercurrentCourses() async {
    emit(GetCurrentCoursesLoading());
    final response = await DioHelper().getData(
        url: APIUrls.API_GET_COURSES,
        query: {"IsFinished": "false", "IncludeOnlyMyCourses": "true"});
    response.fold((error) {
      emit(GetCurrentCoursesError());
    }, (success) {
      emit(
        GetCurrentCoursesSuccess(
          currentCoursesModel: CoursesModel.fromJson(success.data),
        ),
      );
    });
  }

  Future<void> updateProfile(UpdateProfileModel updateProfileModel) async {
    emit(EditProfileLoading());
    if (imageFilePath != null) {
      updateProfileModel.imageUrl = await updateImage(imageFilePath!);
    }
    final response = await DioHelper().putData(
        url: APIUrls.API_USER_PROFILE_UPDATE,
        data: updateProfileModel.toJson(),
        withToken: true);
    response.fold((error) {
      emit(EditProfileError());
    }, (success) {
      emit(EditProfileSuccess());
      imageFilePath = null;
      getProfile();
    });
  }

  String? imageFilePath;
  Future<void> pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        imageFilePath = value.path;
      }
    });
    emit(EditProfileIMGSuccess(url: imageFilePath!));
  }

  Future<String?> updateImage(String path) async {
    emit(EditProfileLoading());
    final response = await DioHelper().postDataImage(
        url: APIUrls.API_USER_Image_UPDATE,
        data: {"file": await DioHelper.uploadFile(File(path))},
        withToken: true);
    return response.fold((error) {
      emit(EditProfileError());
      return null;
    }, (success) {
      return success.data["result"]["url"];
    });
  }
}
