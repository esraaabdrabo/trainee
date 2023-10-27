import 'package:injectable/injectable.dart';

import '../../../../core/entities/acknowledge_entity.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/verify_account_request.dart';
import '../repository/iaccount_repository.dart';

@injectable
class VerifyAccountUseCase extends UseCase<AcknowledgeEntity, VerifyAccountRequest> {
  final IAccountRepository accountRepository;

  VerifyAccountUseCase(this.accountRepository);

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> call(VerifyAccountRequest params) async =>
      await accountRepository.verifyAccount(params);
}