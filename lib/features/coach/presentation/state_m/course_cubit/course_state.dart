part of 'course_cubit.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}
class CurrentCoursesLoading extends CourseState {}

class CurrentCoursesError extends CourseState {}

class CurrentCoursesSuccess extends CourseState {
  CoursesModel currentCoursesModel;

  CurrentCoursesSuccess({required this.currentCoursesModel});
}

class LoadingGetReviewState extends CourseState {}

class ErrorGetReviewData extends CourseState {}

class SuccessGetReviewData extends CourseState {
  ReviewModel reviewModel;

  SuccessGetReviewData({required this.reviewModel});
}

class BookCourseLoadingState extends CourseState {}

class BookCourseLoadedState extends CourseState {}

class BookCourseErrorState extends CourseState {}

class LoadingCreateReviewState extends CourseState {}

class ErrorCreateReviewData extends CourseState {
  String msg;
  ErrorCreateReviewData({required this.msg});
}

class SuccessCreateReviewData extends CourseState {}