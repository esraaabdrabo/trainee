import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/get_story_request.dart';
import '../entity/story_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class GetStoryUseCase extends UseCase<StoryEntity, GetStoryRequest> {
  final IHomeRepository homeRepository;
  GetStoryUseCase(this.homeRepository);
  @override
  Future<Result<AppErrors, StoryEntity>> call(GetStoryRequest params) =>
      homeRepository.getStory(params);
}
