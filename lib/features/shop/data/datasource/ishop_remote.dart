
import 'package:dartz/dartz.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../model/request/get_shops_request.dart';
import '../model/response/shops_model.dart';

abstract class IShopRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, ShopsModel>> getShops(GetShopsRequest params);
}
