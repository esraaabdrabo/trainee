part of 'shop_cubit.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState.shopInitState() = ShopInitState;

  const factory ShopState.shopLoadingState() = ShopLoadingState;

  const factory ShopState.showSearch() = ShopshowSearchState;
  const factory ShopState.hideSearch() = ShopHideSearchState;

  const factory ShopState.shopErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = ShopErrorState;

  const factory ShopState.getShopsState(ShopsEntity shopsEntity) =
      GetShopsState;
}
