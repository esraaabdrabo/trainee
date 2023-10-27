import 'package:dartz/dartz.dart';

import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/params/no_params.dart';
import '../model/request/get_stories_request.dart';
import '../model/request/get_story_request.dart';
import '../model/request/mock_request.dart';
import '../model/response/comments_model.dart';
import '../model/response/people_model.dart';
import '../model/response/specializations_model.dart';
import '../model/response/stories_model.dart';
import '../model/response/story_model.dart';

abstract class IHomeRemoteSource extends RemoteDataSource {
  /// Test APIs
  Future<Either<AppErrors, EmptyResponse>> testSuccess(MockRequest mockRequest);
  Future<Either<AppErrors, EmptyResponse>> testFailure(MockRequest mockRequest);
  Future<Either<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest);
  Future<Either<AppErrors, PeopleDataModel>> getPeople(MockRequest mockRequest);
  Future<Either<AppErrors, List<CommentsModel>>> getComments();

  Future<Either<AppErrors, SpecializationsModel>> getSpecializations(
      NoParams params);

  Future<Either<AppErrors, StoriesModel>> getStories(GetStoriesRequest params);

  Future<Either<AppErrors, StoryModel>> getStory(GetStoryRequest params);
}
