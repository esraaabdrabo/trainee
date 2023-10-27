import 'package:injectable/injectable.dart';

import '../../../../core/entities/acknowledge_entity.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/forgot_password_request.dart';
import '../repository/iaccount_repository.dart';

@injectable
class ForgotPasswordUseCase extends UseCase<AcknowledgeEntity, ForgotPasswordRequest> {
  final IAccountRepository accountRepository;

  ForgotPasswordUseCase(this.accountRepository);

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> call(ForgotPasswordRequest params) async =>
      await accountRepository.forgotPassword(params);
}