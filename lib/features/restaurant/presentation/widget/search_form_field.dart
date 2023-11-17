import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text_field.dart';
import 'package:upgrade_traine_project/features/restaurant/data/model/request/get_restaurants_request.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/state_m/cubit/restaurant_cubit.dart';
import 'package:upgrade_traine_project/generated/l10n.dart';

class AllResraurantsSearchField extends StatelessWidget {
  const AllResraurantsSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      buildWhen: (previous, current) =>
          current is showSearchState || current is HideSearchState,
      builder: (context, state) {
        if (state is showSearchState) {
          return SearchTextField(
              suffix: IconButton(
                  onPressed: () => _clearSearch(context),
                  icon: const Icon(Icons.cancel)),
              hintText: Translation.of(context).search,
              controller:
                  BlocProvider.of<RestaurantCubit>(context).searchController,
              onChanged: (input) => _handleSearch(input, context));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

void _handleSearch(String input, BuildContext context) {
  if ((input.toString()).trim().isNotEmpty) {
    BlocProvider.of<RestaurantCubit>(context)
        .getRestaurants(GetRestaurantsRequest(q: {"Keyword": input}));
  }
}

void _clearSearch(BuildContext context) {
  BlocProvider.of<RestaurantCubit>(context).clearSearch();
}
