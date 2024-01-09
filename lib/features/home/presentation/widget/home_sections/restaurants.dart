import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/common/utils.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/navigation/nav.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/home_screen/home_screen_content.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_sections/section.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/shimmer/section_shimmer.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/all_restaurants.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/restaurant_details.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/state_m/cubit/restaurant_cubit.dart';

class HomeRestaurantsSection extends StatefulWidget {
  const HomeRestaurantsSection({super.key});

  @override
  State<HomeRestaurantsSection> createState() => _HomeRestaurantsSectionState();
}

class _HomeRestaurantsSectionState extends State<HomeRestaurantsSection> {
  late HomeScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<HomeScreenNotifier>(context);
    sn.context = context;

    void goToRestaurant() {
      Nav.to(RestaurantView.routeName, context: context);
    }

    return BlocBuilder<RestaurantCubit, RestaurantState>(
      bloc: sn.restaurantCubit,
      builder: (context, state) => state.when(
        hideSearch: () => const SizedBox(),
        showSearch: () => const SizedBox(),
        restaurantInitState: () => const SizedBox.shrink(),
        restaurantLoadingState: () => const SectionShimmerWidget(),
        restaurantErrorState: (error, callback) => const SizedBox.shrink(),
        getRestaurantsState: (restaurantsEntity) {
          final List<TempWidget> categories0 = [];
          restaurantsEntity.items?.forEach((element) => categories0.add(
                TempWidget(
                  id: element.id ?? 0,
                  imgPath: element.cover ?? '',
                  title: getTranslation(
                    context: context,
                    arText: element.arName,
                    enText: element.enName,
                    alternativeText: element.name,
                  ),
                  description: getTranslation(
                    context: context,
                    alternativeText: element.description,
                    enText: element.enDescription,
                    arText: element.arDescription,
                  ),
                ),
              ));
          return SizedBox(
            width: 1.sw,
            height: 0.38.sh,
            child: HomeSectionWidget(
              title: LanguageHelper.tr(context).restaurants,
              widgets: categories0,
              onSeeAllTapped: () => goToRestaurant(),
              onItemSelected: (index) =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PlayingSliverState(
                            restaurantEntity: restaurantsEntity.items![index],
                          ))),
            ),
          );
        },
      ),
    );
  }
}
