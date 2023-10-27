
import 'package:upgrade_traine_project/features/restaurant/domain/entity/restaurant_entity.dart';

import '../../../../core/entities/base_entity.dart';

class RestaurantsEntity extends BaseEntity {
  RestaurantsEntity({
    this.items,
  });

  final List<RestaurantEntity>? items;

  @override
  List<Object?> get props => [];
}
