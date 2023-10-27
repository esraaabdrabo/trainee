import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/coaches_entity.dart';
import '../datasource/../../domain/repository/icoach_repository.dart';
import '../datasource/icoach_remote.dart';
import '../model/request/get_coaches_request.dart';
import '../model/response/coaches_model.dart';

@Singleton(as: ICoachRepository)
class CoachRepository extends ICoachRepository {
  final ICoachRemoteSource iCoachRemoteSource;

  CoachRepository(this.iCoachRemoteSource);

  @override
  Future<Result<AppErrors, CoachesEntity>> getCoaches(
      GetCoachesRequest params) async {
    var remote = await iCoachRemoteSource.getCoaches(params);
    return execute<CoachesModel, CoachesEntity>(remoteResult: remote);
  }
}
