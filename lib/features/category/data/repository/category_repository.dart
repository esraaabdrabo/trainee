import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/categories_entity.dart';
import '../datasource/../../domain/repository/icategory_repository.dart';
import '../datasource/icategory_remote.dart';
import '../model/response/categories_model.dart';

@Singleton(as: ICategoryRepository)
class CategoryRepository extends ICategoryRepository {
  final ICategoryRemoteSource iCategoryRemoteSource;

  CategoryRepository(this.iCategoryRemoteSource);

  @override
  Future<Result<AppErrors, CategoriesEntity>> getCategories(
      NoParams noParams) async {
    final remote = await iCategoryRemoteSource.getCategories(noParams);
    return execute<CategoriesModel, CategoriesEntity>(remoteResult: remote);
  }
}
