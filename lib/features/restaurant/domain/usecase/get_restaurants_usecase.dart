import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/get_restaurants_request.dart';
import '../entity/restaurants_entity.dart';
import '../repository/irestaurant_repository.dart';

@injectable
class GetRestaurantsUseCse
    extends UseCase<RestaurantsEntity, GetRestaurantsRequest> {
  final IRestaurantRepository restaurantRepository;
  GetRestaurantsUseCse(this.restaurantRepository);

  @override
  Future<Result<AppErrors, RestaurantsEntity>> call(
          GetRestaurantsRequest params) async =>
      restaurantRepository.getRestaurants(params);
}
