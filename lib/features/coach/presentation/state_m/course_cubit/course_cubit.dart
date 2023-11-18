import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/courses_model.dart';
import '../../../../../core/net/api_url.dart';
import '../../../../../core/network/dioHelper.dart';
import '../../../../../core/ui/toast.dart';
import '../../../../restaurant/data/model/response/review_model.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());
  static CourseCubit get(context) => BlocProvider.of(context);

  CoursesModel? coursesModel;

  Future<void> getCoachCurrentCourses({required int trainerId}) async {
    emit(CurrentCoursesLoading());

    final response = await DioHelper().getData(
        url: APIUrls.API_GET_COURSES,
        query: {"TrainerId": trainerId, "keyword": searchController.text});
    response.fold((error) {
      emit(CurrentCoursesError());
    }, (success) {
      coursesModel = CoursesModel.fromJson(success.data);
      emit(
        CurrentCoursesSuccess(
          currentCoursesModel: CoursesModel.fromJson(success.data),
        ),
      );
    });
  }

  Future<void> getReview({required int RefId}) async {
    emit(LoadingGetReviewState());
    final response = await DioHelper().getData(
        url: APIUrls.API_GET_REVIEW, query: {"RefType": 1, "RefId": RefId});
    response.fold((error) {
      emit(ErrorGetReviewData());
    }, (success) {
      emit(SuccessGetReviewData(
          reviewModel: ReviewModel.fromJson(success.data)));
    });
  }

  Future<void> bookCourse({required int courseId}) async {
    emit(BookCourseLoadingState());
    final response = await DioHelper().postData(
        url: APIUrls.API_BOOK_COURSE,
        data: {"courseId": courseId},
        withToken: true);
    response.fold((error) {
      emit(BookCourseErrorState());
    }, (success) {
      emit(BookCourseLoadedState());
      Toast.show('في انتظار الموافقه علي طلبك');
    });
  }

  Future<void> createReview(
      {required int RefId, required String comment, required int rate}) async {
    print("ref id:$RefId");
    emit(LoadingCreateReviewState());
    final response = await DioHelper().postData(
        url: APIUrls.API_CREATE_REVIEW,
        data: {"rate": rate, "comment": comment, "refType": 1, "refId": RefId},
        withToken: true);
    response.fold((error) {
      print("errro:${error.errorMessage}");
      emit(ErrorCreateReviewData(msg: "You already reviewed this item"));
    }, (success) {
      emit(SuccessCreateReviewData());
    });
  }

//search
  bool showSearch = false;
  void showSearchForm() {
    showSearch = !showSearch;
    emit(showSearch ? CoursesShowSearchState() : CoursesHideSearchState());
  }

  var searchController = TextEditingController();
  void clearSearch({required int trainerId}) {
    searchController.clear();
    getCoachCurrentCourses(trainerId: trainerId);
  }
}
