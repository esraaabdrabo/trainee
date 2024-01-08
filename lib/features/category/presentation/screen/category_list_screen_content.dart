import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/common/utils.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/custom_text_field.dart';
import '../../../../core/ui/widgets/image_with_title_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../coach/presentation/screen/coaches_list_screen.dart';
import '../../domain/entity/categories_entity.dart';
import '../../domain/entity/category_entity.dart';
import '../state_m/provider/category_list_screen_notifier.dart';

class CategoryListScreenContent extends StatefulWidget {
  @override
  State<CategoryListScreenContent> createState() =>
      _CategoryListScreenContentState();
}

class _CategoryListScreenContentState extends State<CategoryListScreenContent>
    with TickerProviderStateMixin {
  late CategoryListScreenNotifier sn;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<CategoryListScreenNotifier>(context);
    sn.tabController = TabController(length: 3, vsync: this);
    sn.context = context;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: SizedBox(
        height: 1.sh,
        child: Column(
          children: [
            sn.showSearchField
                ? SearchTextField(
                    hintText: Translation.of(context).search,
                    controller: sn.searchController,
                  )
                : const SizedBox.shrink(),
            Gaps.vGap12,
            _buildCustomTabBar(),
            Gaps.vGap12,
            Expanded(child: _buildTabView())
          ],
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return SizedBox(
      height: 1.sh,
      child: ListView.builder(
          itemCount: sn.displayLists.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>
              _buildCollection(sn.displayLists.elementAt(index))),
    );
  }

  Widget _buildCollection(CategoriesEntity categoriesEntity) {
    return categoriesEntity.items != null
        ? SizedBox(
            height: 1.sh,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: categoriesEntity.items!.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        _gotoCoachesScreen(categoriesEntity
                                            .items!
                                            .elementAt(0));
                                      },
                                      child: ImageWithTitleWidget(
                                        title: getTranslation(
                                            context: context,
                                            arText: categoriesEntity.items!
                                                .elementAt(0)
                                                .arName,
                                            enText: categoriesEntity.items!
                                                .elementAt(0)
                                                .enName,
                                            alternativeText: categoriesEntity
                                                .items!
                                                .elementAt(0)
                                                .name),
                                        imgPath: categoriesEntity.items!
                                                .elementAt(0)
                                                .imageUrl ??
                                            '',
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                            SizedBox(
                              height: 12.w,
                            ),
                            Expanded(
                              flex: 2,
                              child: categoriesEntity.items!.length > 2
                                  ? GestureDetector(
                                      onTap: () {
                                        _gotoCoachesScreen(categoriesEntity
                                            .items!
                                            .elementAt(2));
                                      },
                                      child: ImageWithTitleWidget(
                                        title: getTranslation(
                                            context: context,
                                            alternativeText: categoriesEntity
                                                .items!
                                                .elementAt(2)
                                                .name,
                                            enText: categoriesEntity.items!
                                                .elementAt(2)
                                                .enName,
                                            arText: categoriesEntity.items!
                                                .elementAt(2)
                                                .arName),
                                        imgPath: categoriesEntity.items!
                                                .elementAt(2)
                                                .imageUrl ??
                                            '',
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: categoriesEntity.items!.length > 1
                                  ? GestureDetector(
                                      onTap: () {
                                        _gotoCoachesScreen(categoriesEntity
                                            .items!
                                            .elementAt(1));
                                      },
                                      child: ImageWithTitleWidget(
                                        title: getTranslation(
                                            context: context,
                                            arText: categoriesEntity.items!
                                                .elementAt(1)
                                                .arName,
                                            enText: categoriesEntity.items!
                                                .elementAt(1)
                                                .enName,
                                            alternativeText: categoriesEntity
                                                .items!
                                                .elementAt(1)
                                                .name),
                                        imgPath: categoriesEntity.items!
                                                .elementAt(1)
                                                .imageUrl ??
                                            '',
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                            SizedBox(
                              height: 12.w,
                            ),
                            Expanded(
                              flex: 3,
                              child: categoriesEntity.items!.length > 3
                                  ? GestureDetector(
                                      onTap: () {
                                        _gotoCoachesScreen(categoriesEntity
                                            .items!
                                            .elementAt(3));
                                      },
                                      child: ImageWithTitleWidget(
                                        title: getTranslation(
                                            context: context,
                                            alternativeText: categoriesEntity
                                                .items!
                                                .elementAt(3)
                                                .name,
                                            enText: categoriesEntity.items!
                                                .elementAt(3)
                                                .enName,
                                            arText: categoriesEntity.items!
                                                .elementAt(3)
                                                .arName),
                                        imgPath: categoriesEntity.items!
                                                .elementAt(3)
                                                .imageUrl ??
                                            '',
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.w,
                ),
                Expanded(
                  child: categoriesEntity.items!.length > 4
                      ? GestureDetector(
                          onTap: () {
                            _gotoCoachesScreen(
                                categoriesEntity.items!.elementAt(4));
                          },
                          child: ImageWithTitleWidget(
                            title: getTranslation(
                              context: context,
                              arText:
                                  categoriesEntity.items!.elementAt(4).arName,
                              enText:
                                  categoriesEntity.items!.elementAt(4).enName,
                              alternativeText:
                                  categoriesEntity.items!.elementAt(4).name,
                            ),
                            imgPath:
                                categoriesEntity.items!.elementAt(4).imageUrl ??
                                    '',
                            textAlign: TextAlign.right,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildChosenTabBarItem(String title) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColorLight,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius4),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
        child: CustomText(
          text: title,
          fontSize: AppConstants.textSize16,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColorLight,
        ),
      ),
    );
  }

  Widget _buildNotChosenTabBarItem(int id, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          sn.chosenTap = id;
          sn.selectType(id);
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primaryColorLight,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius4),
            border: Border.all(
              color: AppColors.accentColorLight,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
          child: CustomText(
            text: title,
            fontSize: AppConstants.textSize16,
            fontWeight: FontWeight.bold,
            color: AppColors.accentColorLight,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return SizedBox(
        height: 32.h,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (sn.chosenTap == sn.tabs.elementAt(index).id) {
                return _buildChosenTabBarItem(sn.tabs.elementAt(index).title);
              } else {
                return _buildNotChosenTabBarItem(
                  sn.tabs.elementAt(index).id,
                  sn.tabs.elementAt(index).title,
                );
              }
            },
            separatorBuilder: (context, index) => SizedBox(
                  width: 8.w,
                ),
            itemCount: sn.tabs.length));
  }

  void _gotoCoachesScreen(CategoryEntity? categoryEntity) {
    Nav.to(CoachesListScreen.routeName,
        arguments: categoryEntity, context: context);
  }
}
