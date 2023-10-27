import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../domain/entity/comments_entity.dart';
import '../../domain/entity/people_entity.dart';
import '../../domain/entity/specializations_entity.dart';
import '../../domain/entity/stories_entity.dart';
import '../../domain/entity/story_entity.dart';
import '../../domain/repository/ihome_repository.dart';
import '../datasource/ihome_remote.dart';
import '../model/request/get_stories_request.dart';
import '../model/request/get_story_request.dart';
import '../model/request/mock_request.dart';
import '../model/response/comments_model.dart';
import '../model/response/people_model.dart';
import '../model/response/specializations_model.dart';
import '../model/response/stories_model.dart';
import '../model/response/story_model.dart';


@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  final IHomeRemoteSource iHomeRemoteSource;

  HomeRepository(this.iHomeRemoteSource);

  @override
  Future<Result<AppErrors, EmptyResponse>> testFailure(
      MockRequest mockRequest) async {
    final remote = await iHomeRemoteSource.testFailure(mockRequest);
    return executeForNoEntity<EmptyResponse>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> testSuccess(
      MockRequest mockRequest) async {
    final remote = await iHomeRemoteSource.testSuccess(mockRequest);
    return executeForNoEntity<EmptyResponse>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest) async {
    final remote = await iHomeRemoteSource.testValidator(mockRequest);
    return executeForNoEntity<EmptyResponse>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, PeopleDataEntity>> getPeople(
      MockRequest mockRequest) async {
    final remote = await iHomeRemoteSource.getPeople(mockRequest);
    return execute<PeopleDataModel, PeopleDataEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, List<CommentsEntity>>> getComments() async {
    final remote = await iHomeRemoteSource.getComments();
    return listExecute<CommentsModel, CommentsEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, SpecializationsEntity>> getSpecializations(
      NoParams params) async {
    debugPrint("para:${params.cancelToken}");
    final remote = await iHomeRemoteSource.getSpecializations(params);
    debugPrint("repoImpl");
    return execute<SpecializationsModel, SpecializationsEntity>(
        remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, StoriesEntity>> getStories(
      GetStoriesRequest params) async {
    final remote = await iHomeRemoteSource.getStories(params);

    return execute<StoriesModel, StoriesEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, StoryEntity>> getStory(
      GetStoryRequest params) async {
    final remote = await iHomeRemoteSource.getStory(params);
    return execute<StoryModel, StoryEntity>(remoteResult: remote);
  }
}
