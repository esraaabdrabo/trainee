
import 'package:upgrade_traine_project/features/shop/domain/entity/shop_entity.dart';

import '../../../../core/entities/base_entity.dart';

class ShopsEntity extends BaseEntity {
  ShopsEntity({
    this.totalCount,
    this.items,
  });

  final int? totalCount;
  final List<ShopEntity>? items;

  @override
  List<Object?> get props => [];
}
