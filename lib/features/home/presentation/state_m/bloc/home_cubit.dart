import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/params/no_params.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/get_stories_request.dart';
import '../../../data/model/request/get_story_request.dart';
import '../../../domain/entity/specializations_entity.dart';
import '../../../domain/entity/stories_entity.dart';
import '../../../domain/entity/story_entity.dart';
import '../../../domain/usecase/get_index_usecase.dart';
import '../../../domain/usecase/get_stories_usecase.dart';
import '../../../domain/usecase/get_story_usecase.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.homeInitState());

  void getStories(GetStoriesRequest params) async {
    GetStoriesRequest getStoriesRequest = GetStoriesRequest(
        skipCount: params.skipCount,
        maxResultCount: 10,
        isActive: params.isActive,
        keyword: params.keyword,
        sorting: params.sorting,
        cancelToken: params.cancelToken);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    emit(const HomeState.homeLoadingState());
    await Future<void>.delayed(const Duration(milliseconds: 50));
    final result = await getIt<GetStoriesUseCase>()(getStoriesRequest);

    result.pick(onData: (data) {
      emit(HomeState.getStoriesState(data));
    }, onError: (error) {
      emit(HomeState.homeErrorState(error, () {
        getStories(getStoriesRequest);
      }));
    });
  }

  void getSpecializations() async {
    debugPrint("looo");
    emit(const HomeState.homeLoadingState());
    final result = await getIt<GetIndexUseCase>().call(NoParams());

    result.pick(
      onData: (data) {
        emit(HomeState.getSpecializationsState(result.data!));
      },
      onError: (error) {
        debugPrint("error");
        emit(HomeState.homeErrorState(result.error!, () {
          getSpecializations();
        }));
      },
    );
  }

  void getStory(GetStoryRequest getStoryRequest) async {
    emit(const HomeState.homeLoadingState());
    final result = await getIt<GetStoryUseCase>()(getStoryRequest);

    result.pick(
      onData: (data) {
        emit(HomeState.getStoryState(data));
      },
      onError: (error) {
        emit(HomeState.homeErrorState(error, () {
          getStory(getStoryRequest);
        }));
      },
    );
  }


}
