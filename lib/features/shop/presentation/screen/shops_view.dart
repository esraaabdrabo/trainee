import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_appbar.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/widget/restaurant_card_widget.dart';
import 'package:upgrade_traine_project/features/shop/presentation/screen/shop_details.dart';
import 'package:upgrade_traine_project/features/shop/presentation/state_m/cubit/shop_cubit.dart';
import 'package:upgrade_traine_project/features/shop/presentation/widget/search_form_field.dart';

import '../../../../generated/l10n.dart';
import '../../data/model/request/get_shops_request.dart';

class ShopsView extends StatefulWidget {
  static const routeName = "/AllShopsScreen";
  const ShopsView({Key? key}) : super(key: key);

  @override
  State<ShopsView> createState() => _ShopsViewState();
}

class _ShopsViewState extends State<ShopsView> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShopCubit()..getShops(GetShopsRequest()),
        child: Scaffold(
          appBar: TransparentAppBar(
              actions: const [AllShopsSearchField()],
              title: Translation.of(context).restaurants),
          body: Column(children: [
            const AllShopsSearchField(),
            Expanded(child: BlocBuilder<ShopCubit, ShopState>(
              builder: (context, state) {
                return state.when(
                  hideSearch: () => const SizedBox(),
                  showSearch: () => const SizedBox(),
                  shopInitState: () => const SizedBox.shrink(),
                  shopLoadingState: () =>
                      const Center(child: CircularProgressIndicator()),
                  shopErrorState: (error, callback) => const SizedBox.shrink(),
                  getShopsState: (shopsEntity) => ListView.builder(
                    itemCount: shopsEntity.items!.length,
                    itemBuilder: (context, index) {
                      var item = shopsEntity.items![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: RestaurantAndShopsCardShow(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return ShopDetails(
                                  shopsEntity: shopsEntity.items![index]);
                            }));
                          },
                          item: item,
                        ),
                      );
                    },
                  ),
                );
              },
            )),
          ]),
        ));
  }
}
