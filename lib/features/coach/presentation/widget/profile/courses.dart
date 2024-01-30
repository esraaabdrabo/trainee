import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/courses_carousel_widget.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/course_cubit/course_cubit.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/provider/coach_profile_screen_notifier.dart';

class CoachProfileCourses extends StatelessWidget {
  const CoachProfileCourses({
    super.key,
    required this.sn,
  });

  final CoachProfileScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70.h),
        BlocProvider(
          create: (context) => CourseCubit()
            ..getCoachCurrentCourses(trainerId: sn.coachEntity.id!),
          child: BlocBuilder<CourseCubit, CourseState>(
            buildWhen: (previous, current) {
              return current is CurrentCoursesSuccess ||
                  current is CurrentCoursesLoading;
            },
            builder: (context, state) {
              return state is CurrentCoursesSuccess
                  ? CoursesCarouselWidget(
                      courses: state.currentCoursesModel.result!.items!,
                      title: LanguageHelper.tr(context).courses,
                    )
                  : const CircularProgressIndicator();
            },
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
      ],
    );
  }
}
