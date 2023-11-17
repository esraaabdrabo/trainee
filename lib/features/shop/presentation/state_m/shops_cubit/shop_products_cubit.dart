import 'package:bloc/bloc.dart';
import 'package:upgrade_traine_project/core/network/dioHelper.dart';

import '../../../../../core/net/api_url.dart';
import '../../../data/model/response/products_model.dart';

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
