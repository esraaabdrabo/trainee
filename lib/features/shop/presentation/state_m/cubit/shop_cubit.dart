import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/get_shops_request.dart';
import '../../../domain/entity/shops_entity.dart';
import '../../../domain/usecase/get_shops_usecase.dart';

part 'shop_cubit.freezed.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(const ShopState.shopInitState());

  void getShops(GetShopsRequest params) async {
    emit(const ShopState.shopLoadingState());
    final result = await getIt<GetShopsUseCase>()(params);
    result.pick(
      onData: (data) => emit(ShopState.getShopsState(data)),
      onError: (error) =>
          emit(ShopState.shopErrorState(error, () => getShops(params))),
    );
  }

  //search
  bool showSearch = false;
  void showSearchForm() {
    showSearch = !showSearch;
    emit(showSearch
        ? const ShopState.showSearch()
        : const ShopState.hideSearch());
  }

  var searchController = TextEditingController();
  void clearSearch() {
    searchController.clear();
    getShops(GetShopsRequest());
  }
}
