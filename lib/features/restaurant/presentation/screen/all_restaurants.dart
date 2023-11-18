import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_appbar.dart';
import 'package:upgrade_traine_project/core/ui/widgets/no_data_found.dart';
import 'package:upgrade_traine_project/features/restaurant/data/model/request/get_restaurants_request.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/restaurant_details.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/state_m/cubit/restaurant_cubit.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/widget/restaurant_card_widget.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/widget/search_form_field.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/widget/search_icon.dart';

import '../../../../generated/l10n.dart';

String defaultRestImg =
    'https://th.bing.com/th/id/OIP.MlZXr9dd8Om34xx-wydaQQHaE9?pid=ImgDet&rs=1';
String defaultShopImg =
    'https://i.pinimg.com/originals/70/97/e7/7097e7a47ec728f0c2f62631c90cd451.jpg';

class RestaurantView extends StatelessWidget {
  static const routeName = "/AllRestaurantScreen";

  const RestaurantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantCubit()..getRestaurants(GetRestaurantsRequest()),
      child: Scaffold(
          appBar: TransparentAppBar(
              actions: const [AllRestaurantsSearchIcon()],
              title: Translation.of(context).restaurants),
          body: Column(
            children: [
              const AllResraurantsSearchField(),
              Expanded(
                child: BlocBuilder<RestaurantCubit, RestaurantState>(
                  buildWhen: (previous, current) =>
                      current is GetRestaurantsState,
                  builder: (context, state) {
                    if (state is GetRestaurantsState) {
                      return BlocProvider.of<RestaurantCubit>(context)
                              .restaurants!
                              .items!
                              .isEmpty
                          ? NoDataFoundWidget()
                          : ListView.builder(
                              itemCount:
                                  BlocProvider.of<RestaurantCubit>(context)
                                      .restaurants!
                                      .items!
                                      .length,
                              itemBuilder: (context, index) {
                                var item =
                                    BlocProvider.of<RestaurantCubit>(context)
                                        .restaurants!
                                        .items![index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8),
                                  child: RestaurantAndShopsCardShow(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  PlayingSliverState(
                                                    restaurantEntity: item,
                                                  )));
                                    },
                                    item: item,
                                  ),
                                );
                              },
                            );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          )),
    );
  }
}
