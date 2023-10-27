import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/app_colors.dart';
import '../../../core/common/style/gaps.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/models/courses_model.dart';
import '../../../core/ui/widgets/blur_widget.dart';
import '../../../core/ui/widgets/clock_widget.dart';
import '../../../core/ui/widgets/custom_appbar.dart';
import '../../../core/ui/widgets/custom_button.dart';
import '../../../core/ui/widgets/custom_text.dart';
import '../../../generated/l10n.dart';

class CourseView extends StatelessWidget {
  final CoursesList courseModel;

  const CourseView({Key? key, required this.courseModel}) : super(key: key);

  Widget customListTile(
      {required context, required String title, required String goal}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstants.textSize14),
                ),
                Text(
                  goal,
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstants.textSize14),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.white,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation.of(context).my_course_details,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 471.h,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius12),
                  image: courseModel.imageUrl == null
                      ? const DecorationImage(
                          image: AssetImage(AppConstants.COACH1_IMAGE),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: NetworkImage(courseModel.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 80.h,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: BlurWidget(
                            height: 63.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.w, right: 8.w, top: 14.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: courseModel.name!,
                                        fontWeight: FontWeight.w500,
                                        fontSize: AppConstants.textSize14,
                                      ),
                                      Gaps.hGap4,
                                      CustomText(
                                        text: courseModel.trainer!.text!,
                                        fontWeight: FontWeight.w500,
                                        fontSize: AppConstants.textSize12,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  color: AppColors.accentColorLight,
                                  height: 7.h,
                                  width: 101.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            left: 16.w,
                            bottom: 20.h,
                            child: ClockWidget(
                              duration:
                                  courseModel.trainingHoursCount!.toDouble(),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                Translation.of(context).course_statistic,
                style: TextStyle(
                    color: AppColors.yellow,
                    fontWeight: FontWeight.w900,
                    fontSize: AppConstants.textSize16),
              ),
            ),
            customListTile(
              context: context,
              title: Translation.of(context).coach,
              goal: courseModel.trainer!.text!,
            ),
            customListTile(
                context: context,
                title: Translation.of(context).hoursNumber,
                goal: "${courseModel.trainingHoursCount}"),
            customListTile(
                context: context,
                title: Translation.of(context).finishedHour,
                goal: "${courseModel.creationTime}"),
            customListTile(
                context: context,
                title: Translation.of(context).remainsHours,
                goal: "${courseModel.trainingHoursCount}"),
            customListTile(
                context: context,
                title: Translation.of(context).numberOfAbsenece,
                goal: "4"),
          ],
        ),
      ),
    );
  }
}
