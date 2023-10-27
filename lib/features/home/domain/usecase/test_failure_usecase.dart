import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/mock_request.dart';
import '../repository/ihome_repository.dart';

@injectable
class TestFailureUseCase extends UseCase<EmptyResponse, MockRequest> {
  final IHomeRepository iHomeRepository;

  TestFailureUseCase(this.iHomeRepository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(MockRequest params) async =>
      await iHomeRepository.testFailure(params);
}
