import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/api_url.dart';
import '../model/request/get_shops_request.dart';
import '../model/response/shops_model.dart';
import 'ishop_remote.dart';

@Singleton(as: IShopRemoteSource)
class ShopRemoteSource extends IShopRemoteSource {
  @override
  Future<Either<AppErrors, ShopsModel>> getShops(GetShopsRequest params) async {
    return request<ShopsModel>(
        converter: (json) => ShopsModel.fromJson(json),
        method: HttpMethod.GET,
        url: APIUrls.API_GET_ALL_SHOPS,
        cancelToken: params.cancelToken);
  }
}
