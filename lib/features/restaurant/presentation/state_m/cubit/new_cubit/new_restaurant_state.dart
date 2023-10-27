part of 'new_restaurant_cubit.dart';

@immutable
abstract class NewRestaurantState {}

class NewRestaurantInitial extends NewRestaurantState {}

class RestaurantLoadingState extends NewRestaurantState {}

class LoadedRestaurantsState extends NewRestaurantState {
  RestaurantsEntity restaurantsEntity;

  LoadedRestaurantsState({required this.restaurantsEntity});
}

class RestaurantErrorState extends NewRestaurantState {}

class LoadingGetPlateState extends NewRestaurantState {}

class ErrorGetAllData extends NewRestaurantState {}

class SuccessGetAllData extends NewRestaurantState {
  PlatesModel? platesModel;

  SuccessGetAllData({required this.platesModel});
}

class LoadingGetReviewState extends NewRestaurantState {}

class ErrorGetReviewData extends NewRestaurantState {}

class SuccessGetReviewData extends NewRestaurantState {
  ReviewModel reviewModel;

  SuccessGetReviewData({required this.reviewModel});
}

class LoadingCreateReviewState extends NewRestaurantState {}

class ErrorCreateReviewData extends NewRestaurantState {
  String msg;
  ErrorCreateReviewData({required this.msg});
}

class SuccessCreateReviewData extends NewRestaurantState {}
class AddNewQuntity extends NewRestaurantState {}
class MunisNewQuntity extends NewRestaurantState {}
