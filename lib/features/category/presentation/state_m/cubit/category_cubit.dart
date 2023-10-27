import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/params/no_params.dart';
import '../../../../../di/service_locator.dart';
import '../../../domain/entity/categories_entity.dart';
import '../../../domain/usecase/get_categories_usecase.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState.categoryInitState());

  void getCategories(NoParams noParams) async {
    emit(const CategoryState.categoryLoadingState());

    final result = await getIt<GetCategoriesUseCase>()(noParams);

    result.pick(
      onData: (data) {
        emit(CategoryState.getCategoriesState(result.data!));
        print("saaa${result.data!.totalCount}");
      },
      onError: (error) {
        emit(CategoryState.categoryErrorState(
            error, () => this.getCategories(noParams)));
      },
    );
  }
}
