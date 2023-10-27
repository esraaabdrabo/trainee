import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/shops_entity.dart';
import '../datasource/../../domain/repository/ishop_repository.dart';
import '../datasource/ishop_remote.dart';
import '../model/request/get_shops_request.dart';
import '../model/response/shops_model.dart';

@Singleton(as: IShopRepository)
class ShopRepository extends IShopRepository {
  final IShopRemoteSource iShopRemoteSource;

  ShopRepository(this.iShopRemoteSource);

  @override
  Future<Result<AppErrors, ShopsEntity>> getShops(
      GetShopsRequest params) async {
    final remote = await iShopRemoteSource.getShops(params);
    return execute<ShopsModel, ShopsEntity>(remoteResult: remote);
  }
}
