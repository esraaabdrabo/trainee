
import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/model/request/get_coaches_request.dart';
import '../entity/coaches_entity.dart';

abstract class ICoachRepository extends Repository {
  Future<Result<AppErrors, CoachesEntity>> getCoaches(GetCoachesRequest params);
}
