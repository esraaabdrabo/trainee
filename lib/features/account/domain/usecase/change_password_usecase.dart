import 'package:injectable/injectable.dart';

import '../../../../core/entities/acknowledge_entity.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/change_password_request.dart';
import '../repository/iaccount_repository.dart';

@injectable
class ChangePasswordUseCase
    extends UseCase<AcknowledgeEntity, ChangePasswordRequest> {
  final IAccountRepository accountRepository;

  ChangePasswordUseCase(this.accountRepository);

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> call(
          ChangePasswordRequest params) async =>
      await accountRepository.changePassword(params);
}
