import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/net/response_validators/test_response_validator.dart';
import '../../../../core/params/no_params.dart';
import '../model/request/get_stories_request.dart';
import '../model/request/get_story_request.dart';
import '../model/request/mock_request.dart';
import '../model/response/comments_model.dart';
import '../model/response/people_model.dart';
import '../model/response/specializations_model.dart';
import '../model/response/stories_model.dart';
import '../model/response/story_model.dart';
import 'ihome_remote.dart';

@Injectable(as: IHomeRemoteSource)
class HomeRemoteSource extends IHomeRemoteSource {
  @override
  Future<Either<AppErrors, EmptyResponse>> testFailure(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> testSuccess(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
      responseValidator: TestResponseValidator(),
    );
  }

  @override
  Future<Either<AppErrors, PeopleDataModel>> getPeople(
      MockRequest mockRequest) {
    return request<PeopleDataModel>(
      converter: (json) => PeopleDataModel.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, List<CommentsModel>>> getComments() {
    return listRequest<CommentsModel>(
      converter: (json) => CommentsModel.fromJson(json),
      method: HttpMethod.GET,
      url: "APIUrls.API_JP_COMMENTS",
      baseUrl: APIUrls.BASE_JSON_PLACEHOLDER,
    );
  }

  @override
  Future<Either<AppErrors, SpecializationsModel>> getSpecializations(
      NoParams params) {
    return request(
        converter: (json) => SpecializationsModel.fromJson(json),
        method: HttpMethod.GET,
        cancelToken: params.cancelToken,
        url: APIUrls.API_GET_INDEX);
  }

  @override
  Future<Either<AppErrors, StoriesModel>> getStories(GetStoriesRequest params) {
    return request(
        converter: (json) => StoriesModel.fromJson(json),
        method: HttpMethod.GET,
        url: APIUrls.API_GET_STORIES,
        queryParameters: params.toMap(),
        cancelToken: params.cancelToken);
  }

  @override
  Future<Either<AppErrors, StoryModel>> getStory(GetStoryRequest params) {
    return request(
        converter: (json) => StoryModel.fromJson(json),
        method: HttpMethod.GET,
        url: APIUrls.API_GET_STORY,
        cancelToken: params.cancelToken,
        queryParameters: params.toMap());
  }
}

class PlacesWebServices {
  late Dio dio;
  PlacesWebServices() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> fetchSuggestions(
      String place, String sessionToken) async {
    try {
      Response response = await dio.get(APIUrls.BASE_URL_MAP, queryParameters: {
        "input": place,
        "type": "address",
      //  "components": "country:eg",
        "key": APIUrls.KEY_MAP,
        "sessiontoken": sessionToken
      });
      print(response.data);
      return response.data["predictions"];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocation(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(
        APIUrls.placeLocationBaseUrl,
        queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': APIUrls.KEY_MAP,
          'sessiontoken': sessionToken
        },
      );
      print(response.data);
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }

  Future<dynamic> getDirections(LatLng origin, LatLng destination) async {
    try {
      Response response = await dio.get(
        APIUrls.directionsBaseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': APIUrls.KEY_MAP,
        },
      );
      print(response.data);
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }
}
