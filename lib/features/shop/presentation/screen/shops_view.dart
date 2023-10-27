import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_appbar.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/widget/restaurant_card_widget.dart';
import 'package:upgrade_traine_project/features/shop/presentation/screen/shop_details.dart';
import 'package:upgrade_traine_project/features/shop/presentation/state_m/cubit/shop_cubit.dart';

import '../../../../generated/l10n.dart';
import '../../data/model/request/get_shops_request.dart';
import '../../domain/entity/shops_entity.dart';

class ShopsView extends StatefulWidget {
  static const routeName = "/AllShopsScreen";



  ShopsView({Key? key,}) : super(key: key);

  @override
  State<ShopsView> createState() => _ShopsViewState();
}

class _ShopsViewState extends State<ShopsView> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).stores,
        ),
        body: BlocProvider(
        create: (context) => ShopCubit()..getShops(GetShopsRequest()),
        child: BlocBuilder<ShopCubit,ShopState>(
          builder:(context, state) {
            print(state);
            return state.when(
              shopInitState: () {
                return const SizedBox.shrink();
              },
              shopLoadingState: () {
                return const Center(child: CircularProgressIndicator());
              },
              shopErrorState: (error, callback) {
                return const SizedBox.shrink();
              }, getShopsState:
                (shopsEntity) {
                  return ListView.builder(
                    itemCount: shopsEntity.items!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: RestaurantAndShopsCardShow(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return ShopDetails(shopsEntity:shopsEntity.items![index]);
                            }));
                          },
                          coverImage: shopsEntity.items![index].cover.toString(),
                          title: shopsEntity.items![index].arName.toString(),
                          body: shopsEntity.items![index].arDescription.toString(),
                          avatarImage: shopsEntity.items![index].logo.toString(),
                        ),
                      );
                    },
                  );
                },);
          },
        )));
  }
}
