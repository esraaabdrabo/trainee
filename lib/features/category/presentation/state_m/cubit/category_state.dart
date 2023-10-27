part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.categoryInitState() = CategoryInitState;

  const factory CategoryState.categoryLoadingState() = CategoryLoadingState;

  const factory CategoryState.categoryErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = CategoryErrorState;

  const factory CategoryState.getCategoriesState(
      CategoriesEntity categoriesEntity) = GetCategoriesState;
}
