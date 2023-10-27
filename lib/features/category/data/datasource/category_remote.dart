import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/params/no_params.dart';
import '../model/response/categories_model.dart';
import 'icategory_remote.dart';

@Singleton(as: ICategoryRemoteSource)
class CategoryRemoteSource extends ICategoryRemoteSource {
  @override
  Future<Either<AppErrors, CategoriesModel>> getCategories(NoParams noParams) {
    return request<CategoriesModel>(
        converter: (json) => CategoriesModel.fromJson(json),
        method: HttpMethod.GET,
        url: APIUrls.API_GET_ALL_CATEGORIES,
        cancelToken: noParams.cancelToken);
  }
}
