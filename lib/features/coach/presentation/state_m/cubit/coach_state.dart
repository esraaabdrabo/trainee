part of 'coach_cubit.dart';

@freezed
class CoachState with _$CoachState {
  const factory CoachState.coachInitState() = CoachInitState;

  const factory CoachState.coachLoadingState() = CoachLoadingState;

  const factory CoachState.coachErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = CoachErrorState;

  const factory CoachState.getCoachesState(CoachesEntity coachesEntity) =
      GetCoachesState;
}
