import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/get_coaches_request.dart';
import '../entity/coaches_entity.dart';
import '../repository/icoach_repository.dart';

@injectable
class GetCoachesUseCase extends UseCase<CoachesEntity, GetCoachesRequest> {
  final ICoachRepository coachRepository;

  GetCoachesUseCase(this.coachRepository);

  @override
  Future<Result<AppErrors, CoachesEntity>> call(
          GetCoachesRequest params) async =>
      coachRepository.getCoaches(params);
}
