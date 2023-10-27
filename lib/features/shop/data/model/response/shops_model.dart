
import 'package:upgrade_traine_project/features/shop/data/model/response/shop_model.dart';

import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/shops_entity.dart';

class ShopsModel extends BaseModel<ShopsEntity> {
  ShopsModel({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<ShopModel>? items;

  factory ShopsModel.fromJson(Map<String, dynamic> json) => ShopsModel(
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        items: json["items"] == null
            ? null
            : List<ShopModel>.from(
                json["items"].map((x) => ShopModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount == null ? null : totalCount,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };

  @override
  ShopsEntity toEntity() {
    return ShopsEntity(
      items: this.items?.map((e) => e.toEntity()).toList(),
      totalCount: this.totalCount,
    );
  }
}
