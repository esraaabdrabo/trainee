import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/state_m/cubit/restaurant_cubit.dart';

class AllRestaurantsSearchIcon extends StatelessWidget {
  const AllRestaurantsSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
        builder: (context, state) {
      return IconButton(
          onPressed: () =>
              BlocProvider.of<RestaurantCubit>(context).showSearchForm(),
          icon: const Icon(Icons.search));
    });
  }
}
