
import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/model/request/get_shops_request.dart';
import '../entity/shops_entity.dart';

abstract class IShopRepository extends Repository {
  Future<Result<AppErrors, ShopsEntity>> getShops(GetShopsRequest params);
}
