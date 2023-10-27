import 'package:dartz/dartz.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../model/response/categories_model.dart';

abstract class ICategoryRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, CategoriesModel>> getCategories(NoParams noParams);
}
