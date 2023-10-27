import 'package:injectable/injectable.dart';

import '../../../../core/entities/acknowledge_entity.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/create_new_password_request.dart';
import '../repository/iaccount_repository.dart';

@injectable
class CreateNewPasswordUseCase
    extends UseCase<AcknowledgeEntity, CreateNewPasswordRequest> {
  final IAccountRepository accountRepository;

  CreateNewPasswordUseCase(this.accountRepository);

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> call(
          CreateNewPasswordRequest params) async =>
      await accountRepository.createNewPassword(params);
}
