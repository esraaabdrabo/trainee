import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/model/request/get_stories_request.dart';
import '../entity/stories_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class GetStoriesUseCase extends UseCase<StoriesEntity, GetStoriesRequest> {
  final IHomeRepository homeRepository;

  GetStoriesUseCase(this.homeRepository);

  @override
  Future<Result<AppErrors, StoriesEntity>> call(
          GetStoriesRequest params) async =>
      homeRepository.getStories(params);
}
