import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/common/utils.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/navigation/nav.dart';
import 'package:upgrade_traine_project/features/category/domain/entity/category_entity.dart';
import 'package:upgrade_traine_project/features/category/presentation/screen/category_list_screen.dart';
import 'package:upgrade_traine_project/features/category/presentation/state_m/cubit/category_cubit.dart';
import 'package:upgrade_traine_project/features/coach/presentation/screen/coaches_list_screen.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/home_screen/home_screen_content.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_sections/section.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/shimmer/section_shimmer.dart';

class HomeCategoriesSection extends StatefulWidget {
  const HomeCategoriesSection({super.key});

  @override
  State<HomeCategoriesSection> createState() => _HomeCategoriesSectionState();
}

class _HomeCategoriesSectionState extends State<HomeCategoriesSection> {
  late HomeScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<HomeScreenNotifier>(context);
    sn.context = context;
    void goToCategories() {
      Nav.to(CategoryListScreen.routeName, context: context);
    }

    void gotoCoachesScreen(CategoryEntity? categoryEntity) {
      Nav.to(CoachesListScreen.routeName,
          arguments: categoryEntity, context: context);
    }

    return BlocBuilder<CategoryCubit, CategoryState>(
      bloc: sn.categoryCubit,
      builder: (context, state) => state.when(
        categoryInitState: () => const SizedBox.shrink(),
        categoryLoadingState: () => const SectionShimmerWidget(),
        categoryErrorState: (error, callback) => const SizedBox.shrink(),
        getCategoriesState: (categoriesEntity) {
          final List<TempWidget> categories = [];
          categoriesEntity.items?.forEach(
            (element) => categories.add(
              TempWidget(
                id: element.id ?? 0,
                imgPath: element.iconUrl ?? '',
                title: getTranslation(
                  context: context,
                  alternativeText: element.name,
                  enText: element.enName,
                  arText: element.arName,
                ),
              ),
            ),
          );
          return SizedBox(
            width: 1.sw,
            height: 0.38.sh,
            child: HomeSectionWidget(
                tempImage: AppConstants.COACH4_IMAGE,
                title: LanguageHelper.tr(context).categories,
                widgets: categories,
                onItemSelected: (index) =>
                    gotoCoachesScreen(categoriesEntity.items?.elementAt(index)),
                onSeeAllTapped: goToCategories),
          );
        },
      ),
    );
  }
}
