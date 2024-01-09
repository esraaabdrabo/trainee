import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/common/style/gaps.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/navigation/nav.dart';
import 'package:upgrade_traine_project/core/ui/widgets/image_with_title_widget.dart';
import 'package:upgrade_traine_project/core/ui/widgets/title_widget.dart';
import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';
import 'package:upgrade_traine_project/features/coach/presentation/screen/coach_profile_screen.dart';
import 'package:upgrade_traine_project/features/coach/presentation/screen/coaches_list_screen.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/cubit/coach_cubit.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/shimmer/container_item.dart';

class HomeCoachesSetions extends StatefulWidget {
  const HomeCoachesSetions({super.key});

  @override
  State<HomeCoachesSetions> createState() => _HomeCoachesSetionsState();
}

class _HomeCoachesSetionsState extends State<HomeCoachesSetions> {
  late HomeScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<HomeScreenNotifier>(context);
    sn.context = context;
    void goToCoaches() {
      Nav.to(CoachesListScreen.routeName, context: context);
    }

    return BlocBuilder<CoachCubit, CoachState>(
      bloc: sn.coachCubit,
      builder: (context, state) {
        return state.when(
          coachInitState: () => const SizedBox.shrink(),
          coachLoadingState: () => _buildCoachesSectionShimmer(),
          coachErrorState: (error, callback) => const SizedBox.shrink(),
          getCoachesState: (CoachesEntity) => SizedBox(
            width: 1.sw,
            height: CoachesEntity.items!.length > 8
                ? 0.54.sh
                : CoachesEntity.items!.length > 5
                    ? 0.37.sh
                    : 0.23.sh,
            child: _buildCoachesWidget(
                context: context,
                title: LanguageHelper.tr(context).most_rated_coaches,
                widgets: CoachesEntity.items!,
                onSeeAllTapped: goToCoaches),
          ),
        );
      },
    );
  }
}

void _splitListIntoThree(List list, List list1, List list2, List list3) {
  int count = 1;
  int divider = list.length ~/ 3;
  int addition = 0;
  int addition2 = 0;
  if (divider < 3) {
    divider = list.length ~/ 2;
    if (list.length % 2 != 0) addition = 1;
    if (divider < 3) {
      for (var element in list) {
        list1.add(element);
      }
    } else {
      for (var element in list) {
        if (count <= divider + addition) {
          list1.add(element);
        } else {
          list2.add(element);
        }
        count++;
      }
    }
  } else {
    if (list.length % 3 > 0) addition = 1;
    if (list.length % 3 == 2) addition2 = 1;
    for (var element in list) {
      if (count <= divider + addition) list1.add(element);
      if (count <= (divider) * 2 + addition + addition2 &&
          count > divider + addition) list2.add(element);
      if (count > (divider) * 2 + addition + addition2) list3.add(element);
      count++;
    }
  }
}

Widget _buildCoachesWidget(
    {required BuildContext context,
    required String title,
    required Function onSeeAllTapped,
    required List<CoachEntity> widgets}) {
  List<CoachEntity> list1 = [];
  List<CoachEntity> list2 = [];
  List<CoachEntity> list3 = [];

  _splitListIntoThree(widgets, list1, list2, list3);
  return Container(
    decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius12)),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TitleWidget(
              title: title,
              subtitleColorTapped: onSeeAllTapped,
              subtitle: LanguageHelper.tr(context).see_all,
            ),
          ),
          list1.isNotEmpty
              ? Column(
                  children: [
                    Gaps.vGap16,
                    _buildHorizontalWidget(widgets: list1),
                  ],
                )
              : const SizedBox.shrink(),
          list2.isNotEmpty
              ? Column(
                  children: [
                    Gaps.vGap16,
                    _buildHorizontalWidget(widgets: list2),
                  ],
                )
              : const SizedBox.shrink(),
          list3.isNotEmpty
              ? Column(
                  children: [
                    Gaps.vGap16,
                    _buildHorizontalWidget(widgets: list3),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    ),
  );
}

Widget _buildHorizontalWidget({required List<CoachEntity> widgets}) {
  return SizedBox(
    width: 1.sw,
    height: 0.13.sh,
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      itemCount: widgets.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Nav.to(CoachProfileScreen.routeName,
              arguments: widgets[index], context: context),
          child: ImageWithTitleWidget(
            imgPath: widgets.elementAt(index).imageUrl ?? "",
            title: widgets.elementAt(index).name ?? "",
            description: widgets.elementAt(index).specialization!.text,
            width: 0.25.sw,
            height: 0.113.sh,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 16.w);
      },
    ),
  );
}

Widget _buildCoachesSectionShimmer() {
  return SizedBox(
    width: 1.sw,
    height: 0.38.sh,
    child: Shimmer.fromColors(
        baseColor: AppColors.grey,
        highlightColor: AppColors.lightGrey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShimmerContainerItem(height: 16.h, width: 0.2.sw),
              ],
            ),
            Gaps.vGap16,
            const Expanded(child: ShimmerContainerItem()),
          ],
        )),
  );
}
