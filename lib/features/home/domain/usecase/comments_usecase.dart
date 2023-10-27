import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/comments_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class CommentsUseCase extends UseCase<List<CommentsEntity>, NoParams> {
  final IHomeRepository iHomeRepository;

  CommentsUseCase(this.iHomeRepository);

  @override
  Future<Result<AppErrors, List<CommentsEntity>>> call(NoParams params) async =>
      await iHomeRepository.getComments();
}
