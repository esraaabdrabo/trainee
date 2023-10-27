part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.homeInitState() = HomeInitState;

  const factory HomeState.homeLoadingState() = HomeLoadingState;

  const factory HomeState.homeErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = HomeErrorInitState;

  const factory HomeState.getSpecializationsState(
      SpecializationsEntity specializationsEntity) = SpecializationsLoadedState;
  const factory HomeState.getStoriesState(StoriesEntity storiesEntity) =
      StoriesLoadedState;

  const factory HomeState.getStoryState(StoryEntity storyEntity) =
      StoryLoadedState;
}
