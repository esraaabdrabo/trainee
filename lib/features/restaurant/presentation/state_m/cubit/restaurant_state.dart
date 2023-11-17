part of 'restaurant_cubit.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState.restaurantInitState() = RestaurantInitState;

  const factory RestaurantState.restaurantLoadingState() =
      RestaurantLoadingState;


  const factory RestaurantState.showSearch() =
      showSearchState;
  const factory RestaurantState.hideSearch() =
      HideSearchState;
  const factory RestaurantState.restaurantErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = RestaurantErrorState;

  const factory RestaurantState.getRestaurantsState(
      RestaurantsEntity restaurantsEntity) = GetRestaurantsState;
}
