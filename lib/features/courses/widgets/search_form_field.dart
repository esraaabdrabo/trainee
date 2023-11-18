import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text_field.dart';
import 'package:upgrade_traine_project/core/ui/widgets/search_Form_filed/functions.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/course_cubit/course_cubit.dart';
import 'package:upgrade_traine_project/generated/l10n.dart';

class AllCoursesSearchField extends StatelessWidget {
  final int trainerId;
  const AllCoursesSearchField(this.trainerId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseCubit, CourseState>(
      buildWhen: (previous, current) =>
          current is CoursesShowSearchState ||
          current is CoursesHideSearchState,
      builder: (context, state) {
        if (state is CoursesShowSearchState) {
          return SearchTextField(
              suffix: IconButton(
                  onPressed: () => _clearSearch(context, trainerId),
                  icon: const Icon(Icons.cancel)),
              hintText: Translation.of(context).search,
              controller:
                  BlocProvider.of<CourseCubit>(context).searchController,
              onChanged: (input) => SearchFunctions.onChangeHandler(
                  input, () => _handleSearch(input, context, trainerId)));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

void _handleSearch(String input, BuildContext context, int id) {
  BlocProvider.of<CourseCubit>(context).getCoachCurrentCourses(trainerId: id);
}

void _clearSearch(BuildContext context, int id) {
  BlocProvider.of<CourseCubit>(context).clearSearch(trainerId: id);
}
