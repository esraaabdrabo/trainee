import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/models/courses_model.dart';
import '../../../core/common/app_colors.dart';
import '../../../core/common/style/gaps.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/library/carousel/custom_carousel.dart';
import '../../../core/ui/physics/custom_scroll_physics.dart';
import '../../../core/ui/widgets/clock_widget.dart';
import '../../../features/coach/presentation/state_m/course_cubit/course_cubit.dart';
import '../../../features/courses/presentation/course_view.dart';
import '../../../generated/l10n.dart';

import 'blur_widget.dart';
import 'custom_button.dart';
import 'custom_text.dart';
import 'title_widget.dart';

class CoursesCarouselWidget extends StatefulWidget {
  final List<CoursesList> courses;
  final String title;
  final String? subTitle;
  final bool? myCourse;

  const CoursesCarouselWidget(
      {Key? key,
      required this.courses,
      required this.title,
      this.subTitle,
      this.myCourse = false})
      : super(key: key);

  @override
  _CoursesCarouselWidgetState createState() => _CoursesCarouselWidgetState();
}

class _CoursesCarouselWidgetState extends State<CoursesCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: TitleWidget(
              title: widget.title,
              subtitleColorTapped: () {},
              titleColor: AppColors.white,
              subtitle: widget.subTitle,
            ),
          ),
          Gaps.vGap16,
          if (widget.courses.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: CustomCarousel(
                items: List.generate(
                    widget.courses.length,
                    (index) => !widget.myCourse!
                        ? _buildCourseItemWidget(
                            widget.courses.elementAt(index))
                        : _buildMyCourseItemWidget(
                            widget.courses.elementAt(index))),
                options: CarouselOptions(
                  height: 344.h,
                  viewportFraction: 0.7,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  scrollPhysics: const CustomScrollPhysics(itemDimension: 1),
                  autoPlay: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          if (widget.courses.isEmpty)
            const Center(
              child: Text("لا يوجد كورسات"),
            )
        ],
      ),
    );
  }

  Widget _buildMyCourseItemWidget(CoursesList courseModel) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return CourseView(
            courseModel: courseModel,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius12),
            image:courseModel.imageUrl==null?DecorationImage(
              image:
              AssetImage(AppConstants.COACH1_IMAGE),

              fit: BoxFit.cover,
            ): DecorationImage(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: BlurWidget(
                      height: 63.h,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 8.w, right: 8.w, top: 14.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                  Positioned(
                      left: 16.w,
                      bottom: 20.h,
                      child: ClockWidget(
                        duration: courseModel.trainingHoursCount!.toDouble(),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseItemWidget(CoursesList courseModel) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return CourseView(
            courseModel: courseModel,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius12),
            image: courseModel.imageUrl == null
                ? DecorationImage(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: BlurWidget(
                      height: 63.h,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: courseModel.name!,
                                fontWeight: FontWeight.w500,
                                fontSize: AppConstants.textSize14,
                              ),
                              Gaps.vGap12,
                              CustomText(
                                text: courseModel.fee.toString() +
                                    ' ' +
                                    Translation.of(context).saudi_riyal,
                                fontSize: AppConstants.textSize15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.accentColorLight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    child: SizedBox(
                      height: 28.h,
                      child: BlocBuilder<CourseCubit, CourseState>(
                        builder: (context, state) {
                          return CustomElevatedButton(
                            textMaxLines: 1,
                            text: Translation.of(context).book_now,
                            textSize: AppConstants.textSize12,
                            onTap: () {
                              CourseCubit.get(context)
                                  .bookCourse(courseId: courseModel.id!);
                            },
                            borderRadius: AppConstants.borderRadius4,
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                      left: 16.w,
                      bottom: 10.h,
                      child: ClockWidget(
                        duration: courseModel.trainingHoursCount!.toDouble(),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
