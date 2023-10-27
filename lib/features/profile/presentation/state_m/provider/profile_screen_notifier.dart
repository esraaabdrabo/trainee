import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/features/profile/presentation/state_m/cubit/profile_cubit.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../coach/presentation/state_m/provider/coach_profile_screen_notifier.dart';

class ProfileScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  TempProfile _profile = TempProfile(
      name: 'رامي المصري',
      location: 'جدة، شارع الملك',
      phoneNumber: 5438524686);
  List<TempCourseModel> _courses = [
    TempCourseModel('كورس ركوب الخيل', 40, 2000, AppConstants.BIKE_RIDING_IMG,
        'رامي المصري'),
    TempCourseModel(
        'كورس السباحة', 60, 2500, AppConstants.SWIMMING_IMG, 'رامي المصري'),
    TempCourseModel('كورس ركوب الخيل', 40, 2000, AppConstants.BIKE_RIDING_IMG,
        'رامي المصري'),
    TempCourseModel(
        'كورس السباحة', 60, 2500, AppConstants.SWIMMING_IMG, 'رامي المصري'),
  ];

  TempProfile get profile => _profile;

  ProfileCubit profileCubit=ProfileCubit();

  set profile(TempProfile value) {
    _profile = value;
  }

  List<TempCourseModel> get courses => _courses;

  set courses(List<TempCourseModel> value) {
    _courses = value;
  }

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}

//todo refactor
class TempProfile {
  String name;
  String location;
  int phoneNumber;

  TempProfile(
      {required this.name, required this.location, required this.phoneNumber});
}
