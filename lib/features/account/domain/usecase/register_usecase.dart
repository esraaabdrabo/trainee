import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/register_request.dart';
import '../entity/register_entity.dart';
import '../repository/iaccount_repository.dart';

@injectable
class RegisterUseCase extends UseCase<RegisterEntity, RegisterRequest> {
  final IAccountRepository accountRepository;

  RegisterUseCase(this.accountRepository);

  @override
  Future<Result<AppErrors, RegisterEntity>> call(
          RegisterRequest params) async =>
      await accountRepository.register(params);
}
