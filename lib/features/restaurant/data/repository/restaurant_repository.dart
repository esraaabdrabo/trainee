import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/restaurants_entity.dart';
import '../datasource/../../domain/repository/irestaurant_repository.dart';
import '../datasource/irestaurant_remote.dart';
import '../model/request/get_restaurants_request.dart';
import '../model/response/restaurants_model.dart';

@Singleton(as: IRestaurantRepository)
class RestaurantRepository extends IRestaurantRepository {
  final IRestaurantRemoteSource iRestaurantRemoteSource;

  RestaurantRepository(this.iRestaurantRemoteSource);

  @override
  Future<Result<AppErrors, RestaurantsEntity>> getRestaurants(
      GetRestaurantsRequest params) async {
    final remote = await iRestaurantRemoteSource.getRestaurants(params);
    return execute<RestaurantsModel, RestaurantsEntity>(remoteResult: remote);
  }
}
