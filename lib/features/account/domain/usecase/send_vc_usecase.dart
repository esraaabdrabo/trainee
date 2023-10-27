import 'package:injectable/injectable.dart';

import '../../../../core/entities/acknowledge_entity.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/send_verification_code_request.dart';
import '../repository/iaccount_repository.dart';

@injectable
class SendVCUseCase
    extends UseCase<AcknowledgeEntity, SendVerificationCodeRequest> {
  final IAccountRepository accountRepository;

  SendVCUseCase(this.accountRepository);

  @override
  Future<Result<AppErrors, AcknowledgeEntity>> call(
          SendVerificationCodeRequest params) async =>
      await accountRepository.sendVC(params);
}
