import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/search_Form_filed/functions.dart';
import 'package:upgrade_traine_project/features/coach/data/model/request/get_coaches_request.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/cubit/coach_cubit.dart';
import 'package:upgrade_traine_project/features/coach/presentation/state_m/provider/coaches_list_screen_notifier.dart';

class AllCoachesSearchField extends StatelessWidget {
  const AllCoachesSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final sn = Provider.of<CoachesListScreenNotifier>(context);

    return BlocBuilder<CoachCubit, CoachState>(
      bloc: sn.coachCubit,
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.backgroundGradient3,
                  AppColors.backgroundGradient2,
                  AppColors.backgroundGradient1,
                ]),
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: TextFormField(
            controller: sn.coachCubit.searchController,
            onChanged: (input) => SearchFunctions.onChangeHandler(
              input,
              () => _handleSearch(input, sn),
            ),
            decoration: InputDecoration(
              hintText: LanguageHelper.tr(context).need_specific_trainer,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () => _clearSearch(sn),
                  icon: const Icon(Icons.cancel)),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

void _handleSearch(String input, CoachesListScreenNotifier sn) {
  sn.coaches = [];
  sn.coachCubit.getCoaches(GetCoachesRequest(q: {"Keyword": input}));
}

void _clearSearch(CoachesListScreenNotifier sn) {
  sn.coachCubit.clearSearch();
}
