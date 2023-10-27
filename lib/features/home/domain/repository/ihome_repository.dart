
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/model/request/get_stories_request.dart';
import '../../data/model/request/get_story_request.dart';
import '../../data/model/request/mock_request.dart';
import '../entity/comments_entity.dart';
import '../entity/people_entity.dart';
import '../entity/specializations_entity.dart';
import '../entity/stories_entity.dart';
import '../entity/story_entity.dart';

abstract class IHomeRepository extends Repository {
  /// Test APIs
  Future<Result<AppErrors, EmptyResponse>> testSuccess(MockRequest mockRequest);
  Future<Result<AppErrors, EmptyResponse>> testFailure(MockRequest mockRequest);
  Future<Result<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest);
  Future<Result<AppErrors, PeopleDataEntity>> getPeople(
      MockRequest mockRequest);
  Future<Result<AppErrors, List<CommentsEntity>>> getComments();
  Future<Result<AppErrors, SpecializationsEntity>> getSpecializations(
      NoParams params);

  Future<Result<AppErrors, StoriesEntity>> getStories(GetStoriesRequest params);

  Future<Result<AppErrors, StoryEntity>> getStory(GetStoryRequest params);
}
