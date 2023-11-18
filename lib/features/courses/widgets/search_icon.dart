import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/course_cubit/course_cubit.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/state_m/cubit/restaurant_cubit.dart';

class AllCoursessSearchIcon extends StatelessWidget {
  const AllCoursessSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
      return IconButton(
          onPressed: () =>
              BlocProvider.of<CourseCubit>(context).showSearchForm(),
          icon: const Icon(Icons.search));
    });
  }
}
