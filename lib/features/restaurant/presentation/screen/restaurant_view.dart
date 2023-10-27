import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_appbar.dart';
import 'package:upgrade_traine_project/features/restaurant/data/model/request/get_restaurants_request.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/restaurant_details.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/state_m/cubit/restaurant_cubit.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/widget/restaurant_card_widget.dart';

import '../../../../generated/l10n.dart';
import '../../domain/entity/restaurants_entity.dart';

class RestaurantView extends StatelessWidget {

  static const routeName = "/AllRestaurantScreen";

   const RestaurantView({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(
        title: Translation
            .of(context)
            .restaurants,
      ),
      body: BlocProvider(
  create: (context) => RestaurantCubit()..getRestaurants(GetRestaurantsRequest()),
  child: BlocBuilder<RestaurantCubit,RestaurantState>(
        builder: (context, state) {
        if(state is GetRestaurantsState){
          return ListView.builder(
            itemCount:BlocProvider.of<RestaurantCubit>(context).restaurants!.items!.length ,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8),
                child: RestaurantAndShopsCardShow(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PlayingSliverState(
                          restaurantEntity: BlocProvider.of<RestaurantCubit>(context).restaurants!.items![index],
                        )));
                  },
                  coverImage:BlocProvider.of<RestaurantCubit>(context).restaurants!.items![index].cover.toString() ,
                  title:BlocProvider.of<RestaurantCubit>(context).restaurants!.items![index].arName.toString(),
                  body: BlocProvider.of<RestaurantCubit>(context).restaurants!.items![index].arDescription.toString(),
                  avatarImage: BlocProvider.of<RestaurantCubit>(context).restaurants!.items![index].logo.toString(),

                ),
              );
            },
          );
        }else{
          return const SizedBox();
        }
      },),
)

    );
  }
}