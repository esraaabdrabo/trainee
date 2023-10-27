import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';
import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/constants/app/app_constants.dart';
import 'coaches_list_screen_notifier.dart';

class CoachProfileScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  late TempCoachModel _tempCoachModel;
  late CoachEntity _coachEntity;
  int _rate = 1;
  bool _subbed = false;
  List<TempCourseModel> _courses = [
    TempCourseModel('كورس ركوب الخيل', 40, 2000, AppConstants.BIKE_RIDING_IMG,'رامي المصري'),
    TempCourseModel('كورس السباحة', 60, 2500, AppConstants.SWIMMING_IMG,'رامي المصري'),
    TempCourseModel('كورس ركوب الخيل', 40, 2000, AppConstants.BIKE_RIDING_IMG,'رامي المصري'),
    TempCourseModel('كورس السباحة', 60, 2500, AppConstants.SWIMMING_IMG,'رامي المصري'),
  ];
  List<TempCommentModel> _comments = [
    TempCommentModel(
      image: AppConstants.COACH1_IMAGE,
      name: 'سلمى العلبي',
      date: DateTime.parse('20220123'),
      comment:
          'التدريب الشخصي هو تمرين يمكنك من التخطيط وتتبع تمرينك الشخصي. بطريقة اكثر فعالية وذات نتائج سريعة.',
    ),
    TempCommentModel(
      image: AppConstants.COACH2_IMAGE,
      name: 'سلمى العلبي',
      date: DateTime.parse('20220123'),
      comment:
          'التدريب الشخصي هو تمرين يمكنك من التخطيط وتتبع تمرينك الشخصي. بطريقة اكثر فعالية وذات نتائج سريعة.',
    ),
    TempCommentModel(
      image: AppConstants.COACH3_IMAGE,
      name: 'سلمى العلبي',
      date: DateTime.parse('20220113'),
      comment:
          'التدريب الشخصي هو تمرين يمكنك من التخطيط وتتبع تمرينك الشخصي. بطريقة اكثر فعالية وذات نتائج سريعة.',
    ),
    TempCommentModel(
      image: AppConstants.COACH4_IMAGE,
      name: 'سلمى العلبي',
      date: DateTime.parse('20220105'),
      comment:
          'التدريب الشخصي هو تمرين يمكنك من التخطيط وتتبع تمرينك الشخصي. بطريقة اكثر فعالية وذات نتائج سريعة.',
    ),
  ];

  CoachProfileScreenNotifier(this._coachEntity);

  CoachEntity get coachEntity => _coachEntity;

  set tempCoachModel(CoachEntity value) {
    _coachEntity = value;
  }

  List<TempCourseModel> get courses => _courses;

  set courses(List<TempCourseModel> value) {
    _courses = value;
  }

  /// Getters and Setters
  List<TempCommentModel> get comments => _comments;

  set comments(List<TempCommentModel> value) {
    _comments = value;
  }

  bool get subbed => _subbed;

  set subbed(bool value) {
    _subbed = value;
  }

  int get rate => _rate;

  set rate(int value) {
    _rate = value;
  }

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}

//todo refactoring
class TempCourseModel {
  String title;
  double duration;
  double cost;
  String image;
  String coach;

  TempCourseModel(this.title, this.duration, this.cost, this.image, this.coach);
}

class TempCommentModel {
  String image;
  String name;
  DateTime date;
  String comment;

  TempCommentModel(
      {required this.image,
      required this.name,
      required this.date,
      required this.comment});
}
