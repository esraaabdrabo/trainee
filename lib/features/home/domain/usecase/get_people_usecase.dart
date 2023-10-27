import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/mock_request.dart';
import '../entity/people_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class GetPeopleUseCase extends UseCase<PeopleDataEntity, MockRequest> {
  final IHomeRepository iHomeRepository;

  GetPeopleUseCase(this.iHomeRepository);

  @override
  Future<Result<AppErrors, PeopleDataEntity>> call(MockRequest params) async =>
      await iHomeRepository.getPeople(params);
}
