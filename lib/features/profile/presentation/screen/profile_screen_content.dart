import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upgrade_traine_project/features/profile/presentation/state_m/cubit/profile_cubit.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/ui/widgets/blur_widget.dart';
import '../../../../core/ui/widgets/courses_carousel_widget.dart';
import '../../../../core/ui/widgets/custom_text.dart';
import '../../../../core/ui/widgets/title_widget.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/profile_screen_notifier.dart';

var defaultTrainneImageUrl =
    'https://www.bing.com/images/blob?bcid=RO6.8XCnsEcGqxcxoNWLuD9SqbotqVTdP3M';

class ProfileScreenContent extends StatefulWidget {
  @override
  State<ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    BlocProvider.of<ProfileCubit>(context).getUsercurrentCourses();
    BlocProvider.of<ProfileCubit>(context).getUserFinishedCourses();
    super.initState();
  }

  Widget _buildShimmerContainerItem({double? height, double? width}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius4),
        color: AppColors.grey,
      ),
      width: width,
      height: height,
    );
  }

  Widget _buildSectionShimmer({double? width}) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: 1.sw,
        height: 0.38.sh,
        child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.lightGrey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShimmerContainerItem(
                    height: 0.52.sh,
                    width: width ?? 1.sw,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              buildWhen: (previous, current) =>
                  previous != current && current is ProfileSuccess,
              builder: (context, state) {
                if (state is ProfileSuccess) {
                  return _buildCoverInfoWidget(
                      phoneNumber: BlocProvider.of<ProfileCubit>(context)
                          .profileModel!
                          .result!
                          .phoneNumber
                          .toString(),
                      name: BlocProvider.of<ProfileCubit>(context)
                              .profileModel!
                              .result!
                              .name ??
                          "Coach Trainee");
                } else {
                  return _buildSectionShimmer();
                }
              },
            ),
            SizedBox(
              height: 50.h,
            ),
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              buildWhen: (previous, current) =>
                  previous != current && current is GetCurrentCoursesSuccess,
              builder: (context, state) {
                if (state is GetCurrentCoursesSuccess) {
                  return CoursesCarouselWidget(
                    courses: state.currentCoursesModel.result!.items!,
                    title: Translation.of(context).current_courses,
                    myCourse: true,
                  );
                } else {
                  return _buildSectionShimmer(width: 200.w);
                }
              },
            ),
            SizedBox(
              height: 50.h,
            ),
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              buildWhen: (previous, current) =>
                  previous != current && current is FinishedCoursesSuccess,
              builder: (context, state) {
                if (state is FinishedCoursesSuccess) {
                  return CoursesCarouselWidget(
                    courses: state.finishedCoursesModel.result!.items!,
                    title: Translation.of(context).ended_courses,
                    myCourse: true,
                  );
                } else {
                  return const Center(
                    child: SizedBox(),
                  );
                }
              },
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodsWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlurWidget(
        height: 159.h,
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 16.h,
          ),
          child: Column(
            children: [
              TitleWidget(
                  title: Translation.of(context).payment_ways,
                  subtitle: Translation.of(context).see_all,
                  subtitleColorTapped: () {}),
              Gaps.vGap12,
              SizedBox(
                height: 92.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 76.w,
                        height: 92.h,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppConstants.borderRadius8),
                          color: AppColors.primaryColorLight,
                        ),
                        child: Center(
                          child: Image.asset(
                            AppConstants.MASTER_CARD_IMG,
                            height: 29.h,
                            width: 48.w,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Gaps.hGap16,
                    itemCount: 7),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverInfoWidget(
      {required String phoneNumber, required String name}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        height: 0.52.sh,
        width: 1.sw,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius8),
            image: DecorationImage(
                image: NetworkImage(BlocProvider.of<ProfileCubit>(context)
                        .profileModel!
                        .result!
                        .imageUrl ??
                    defaultTrainneImageUrl),
                fit: BoxFit.cover),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.darkGrey.withOpacity(0.8),
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius8)),
                height: 112.h,
                width: 1.sw,
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name,
                        fontSize: AppConstants.textSize24,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      // Row(
                      //   children: [
                      //     ImageIcon(
                      //       const AssetImage(AppConstants.LOCATION_ICON),
                      //       size: 16.w,
                      //       color: AppColors.accentColorLight,
                      //     ),
                      //     Gaps.hGap8,
                      //     CustomText(
                      //       text: sn.profile.location,
                      //       fontSize: AppConstants.textSize12,
                      //       fontWeight: FontWeight.w500,
                      //     )
                      //   ],
                      // ),
                      Gaps.vGap8,
                      Row(
                        children: [
                          ImageIcon(
                            const AssetImage(AppConstants.CALL_ICON),
                            size: 16.w,
                            color: AppColors.accentColorLight,
                          ),
                          Gaps.hGap8,
                          CustomText(
                            text: phoneNumber,
                            fontSize: AppConstants.textSize12,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
