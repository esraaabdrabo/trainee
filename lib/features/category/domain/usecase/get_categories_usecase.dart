import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/categories_entity.dart';
import '../repository/icategory_repository.dart';

@injectable
class GetCategoriesUseCase extends UseCase<CategoriesEntity, NoParams> {
  final ICategoryRepository categoryRepository;

  GetCategoriesUseCase(this.categoryRepository);

  @override
  Future<Result<AppErrors, CategoriesEntity>> call(NoParams params) async =>
      await categoryRepository.getCategories(params);
}
