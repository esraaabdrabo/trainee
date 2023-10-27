import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/login_request.dart';
import '../entity/login_entity.dart';
import '../repository/iaccount_repository.dart';

@injectable
class LoginUseCase extends UseCase<LoginEntity, LoginRequest> {
  final IAccountRepository accountRepository;

  LoginUseCase(this.accountRepository);

  @override
  Future<Result<AppErrors, LoginEntity>> call(LoginRequest params) async =>
      await accountRepository.login(params);
}
