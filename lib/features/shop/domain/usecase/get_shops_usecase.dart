import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/get_shops_request.dart';
import '../entity/shops_entity.dart';
import '../repository/ishop_repository.dart';

@injectable
class GetShopsUseCase extends UseCase<ShopsEntity, GetShopsRequest> {
  final IShopRepository shopRepository;
  GetShopsUseCase(this.shopRepository);

  @override
  Future<Result<AppErrors, ShopsEntity>> call(GetShopsRequest params) async =>
      shopRepository.getShops(params);
}
