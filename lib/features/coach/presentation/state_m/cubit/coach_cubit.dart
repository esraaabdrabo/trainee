import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/results/result.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/model/request/get_coaches_request.dart';
import '../../../domain/entity/coach_entity.dart';
import '../../../domain/entity/coaches_entity.dart';
import '../../../domain/usecase/get_coaches_usecase.dart';

part 'coach_cubit.freezed.dart';
part 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  CoachCubit() : super(const CoachState.coachInitState());

  void getCoaches(GetCoachesRequest params) async {
    emit(const CoachState.coachLoadingState());
    final result = await getIt<GetCoachesUseCase>()(params);



    result.pick(onData: (data) {
      emit(CoachState.getCoachesState(data));
    }, onError: (error) {
      print(error.toString());
      emit(CoachState.coachErrorState(error, () => this.getCoaches(params)));
    });
  }

  Future<Result<AppErrors, List<CoachEntity>>> returnCoaches(
      GetCoachesRequest params) async {
    final result = await getIt<GetCoachesUseCase>()(params);
    return Result(error: result.error, data: result.data?.items ?? []);
  }
}
