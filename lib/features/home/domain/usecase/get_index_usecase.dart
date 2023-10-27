import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/specializations_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class GetIndexUseCase extends UseCase<SpecializationsEntity, NoParams> {
  final IHomeRepository homeRepository;
  GetIndexUseCase({required this.homeRepository});
  @override
  Future<Result<AppErrors, SpecializationsEntity>> call(NoParams params) {
    return homeRepository.getSpecializations(params);
  }
}
