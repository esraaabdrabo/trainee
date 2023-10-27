import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upgrade_traine_project/core/network/dioHelper.dart';
import 'package:upgrade_traine_project/features/restaurant/data/model/response/plates_model.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/net/api_url.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/get_shops_request.dart';
import '../../../data/model/response/products_model.dart';
import '../../../domain/entity/shops_entity.dart';
import '../../../domain/usecase/get_shops_usecase.dart';

part 'shops_state.dart';

class ShopsCubit extends Cubit<ShopsState> {
  ShopsCubit() : super(ShopsInitialState());


  Future<void> getProducts({required int shopId}) async {
    emit(GetProductsLoading());
    final response = await DioHelper().getData(
        url: APIUrls.API_GET_PRODUCTS, query: {"ShopId": shopId});
    response.fold((error) {
      emit(GetProductsError());
    }, (success) {
      emit(GetProductsLoaded(ProductsModel.fromJson(success.data)));
    });
  }

}
