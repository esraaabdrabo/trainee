import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/errors/app_errors.dart';
import '../../../../../../core/net/api_url.dart';
import '../../../../../../core/network/dioHelper.dart';
import '../../../../../../di/service_locator.dart';
import '../../../../data/model/request/get_restaurants_request.dart';
import '../../../../data/model/response/plates_model.dart';
import '../../../../data/model/response/review_model.dart';
import '../../../../domain/entity/restaurants_entity.dart';
import '../../../../domain/usecase/get_restaurants_usecase.dart';

part 'new_restaurant_state.dart';

class NewRestaurantCubit extends Cubit<NewRestaurantState> {
  NewRestaurantCubit() : super(NewRestaurantInitial());

  static NewRestaurantCubit get(context) => BlocProvider.of(context);

  void getRestaurants(GetRestaurantsRequest params) async {
    emit(RestaurantLoadingState());
    final result = await getIt<GetRestaurantsUseCse>()(params);
    result.pick(onData: (data) {
      emit(LoadedRestaurantsState(restaurantsEntity: data));
    }, onError: (error) {
      emit(RestaurantErrorState());
    });
  }

  Future<void> getPlates({required int RestaurantId}) async {
    emit(LoadingGetPlateState());
    final response = await DioHelper().getData(
        url: APIUrls.API_GET_PLATES, query: {"RestaurantId": RestaurantId});
    response.fold((error) {
      emit(ErrorGetAllData());
    }, (success) {
      emit(SuccessGetAllData(platesModel: PlatesModel.fromJson(success.data)));
    });
  }

  Future<void> getReview({required int RefId,required int refType}) async {
    emit(LoadingGetReviewState());
    final response = await DioHelper().getData(
        url: APIUrls.API_GET_REVIEW, query: {"RefType": refType, "RefId": RefId});
    response.fold((error) {
      emit(ErrorGetReviewData());
    }, (success) {
      emit(SuccessGetReviewData(
          reviewModel: ReviewModel.fromJson(success.data)));
    });
  }

  Future<void> createReview(
      {required int RefId, required String comment, required int rate,required int refType}) async {
    emit(LoadingCreateReviewState());
    final response = await DioHelper().postData(
        url: APIUrls.API_CREATE_REVIEW,
        data: {"rate": rate, "comment": comment, "refType": refType, "refId": RefId},
        withToken: true);
    response.fold((error) {
      emit(ErrorCreateReviewData(msg: "You already reviewed this item"));
    }, (success) {
      emit(SuccessCreateReviewData());
    });
  }
  int numberOfRequiredQuntity=1;
  void addQuntity(){
    numberOfRequiredQuntity++;
    emit(AddNewQuntity());
  }
  void munisQuntity(){
    if (numberOfRequiredQuntity>1)numberOfRequiredQuntity--;
    emit(MunisNewQuntity());
  }
}
