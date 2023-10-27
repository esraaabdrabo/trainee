import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/get_restaurants_request.dart';
import '../../../domain/entity/restaurants_entity.dart';
import '../../../domain/usecase/get_restaurants_usecase.dart';

part 'restaurant_cubit.freezed.dart';
part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(const RestaurantState.restaurantInitState());

  RestaurantsEntity? restaurants;

  void getRestaurants(GetRestaurantsRequest params) async {
    emit(const RestaurantState.restaurantLoadingState());
    final result = await getIt<GetRestaurantsUseCse>()(params);
    result.pick(onData: (data) {
      restaurants = data;
      print(restaurants);
      emit(RestaurantState.getRestaurantsState(data));

    }, onError: (error) {
      emit(RestaurantState.restaurantErrorState(
          error, () => getRestaurants(params)));
    });
  }
}
