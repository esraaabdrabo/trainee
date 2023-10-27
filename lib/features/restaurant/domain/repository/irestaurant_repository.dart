
import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/model/request/get_restaurants_request.dart';
import '../entity/restaurants_entity.dart';

abstract class IRestaurantRepository extends Repository {
  Future<Result<AppErrors, RestaurantsEntity>> getRestaurants(
      GetRestaurantsRequest params);
}
