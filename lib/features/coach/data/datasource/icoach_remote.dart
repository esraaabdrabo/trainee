import 'package:dartz/dartz.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../model/request/get_coaches_request.dart';
import '../model/response/coaches_model.dart';

abstract class ICoachRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, CoachesModel>> getCoaches(
      GetCoachesRequest noParams);
}
