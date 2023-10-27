import 'package:dartz/dartz.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../model/response/profile_model.dart';

abstract class IProfileRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, ProfileModel>> getProfile(NoParams params);
}
