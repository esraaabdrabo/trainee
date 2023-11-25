import 'package:upgrade_traine_project/features/restaurant/data/model/response/restaurant_model.dart';

import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/restaurants_entity.dart';

class RestaurantsModel extends BaseModel<RestaurantsEntity> {
  RestaurantsModel({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<RestaurantModel>? items;

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) =>
      RestaurantsModel(
        totalCount: json["totalCount"],
        items: json["items"] == null
            ? null
            : List<RestaurantModel>.from(
                json["items"].map((x) => RestaurantModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };

  @override
  RestaurantsEntity toEntity() {
    return RestaurantsEntity(items: items?.map((e) => e.toEntity()).toList());
  }
}
