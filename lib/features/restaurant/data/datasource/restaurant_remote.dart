import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/api_url.dart';
import '../model/request/get_restaurants_request.dart';
import '../model/response/plates_model.dart';
import '../model/response/restaurants_model.dart';
import 'irestaurant_remote.dart';

@Singleton(as: IRestaurantRemoteSource)
class RestaurantRemoteSource extends IRestaurantRemoteSource {
  @override
  Future<Either<AppErrors, RestaurantsModel>> getRestaurants(
      GetRestaurantsRequest params) async {
    return request<RestaurantsModel>(
      queryParameters: params.q,
        converter: (json) => RestaurantsModel.fromJson(json),
        method: HttpMethod.GET,
        url: APIUrls.API_GET_ALL_RESTAURANTS,
        cancelToken: params.cancelToken);
  }
}
