
import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../entity/categories_entity.dart';

abstract class ICategoryRepository extends Repository {
  Future<Result<AppErrors, CategoriesEntity>> getCategories(NoParams noParams);
}
