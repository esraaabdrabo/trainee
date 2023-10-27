import 'package:dartz/dartz.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../model/request/get_restaurants_request.dart';
import '../model/response/restaurants_model.dart';

abstract class IRestaurantRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, RestaurantsModel>> getRestaurants(
      GetRestaurantsRequest params);
}
