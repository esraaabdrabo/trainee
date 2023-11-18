import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_appbar.dart';
import 'package:upgrade_traine_project/core/ui/widgets/no_data_found.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/widget/restaurant_card_widget.dart';
import 'package:upgrade_traine_project/features/shop/domain/entity/shops_entity.dart';
import 'package:upgrade_traine_project/features/shop/presentation/screen/shop_details.dart';
import 'package:upgrade_traine_project/features/shop/presentation/state_m/cubit/shop_cubit.dart';
import 'package:upgrade_traine_project/features/shop/presentation/widget/search_form_field.dart';
import 'package:upgrade_traine_project/features/shop/presentation/widget/search_icon.dart';

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
              actions: const [AllShopsSearchIcon()],
              title: Translation.of(context).supplements_shops),
          body: Column(children: [
            const AllShopsSearchField(),
            Expanded(
              child: BlocBuilder<ShopCubit, ShopState>(
                buildWhen: (previous, current) =>
                    current is GetShopsState || current is ShopLoadingState,
                builder: (context, state) {
                  return state is GetShopsState
                      ? _AllShopsListView(state.shopsEntity)
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ]),
        ));
  }
}

class _AllShopsListView extends StatelessWidget {
  final ShopsEntity shopsEntity;
  const _AllShopsListView(this.shopsEntity);

  @override
  Widget build(BuildContext context) {
    return shopsEntity.items!.isEmpty
        ? NoDataFoundWidget()
        : ListView.builder(
            itemCount: shopsEntity.items!.length,
            itemBuilder: (context, index) {
              var item = shopsEntity.items![index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: RestaurantAndShopsCardShow(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ShopDetails(
                          shopsEntity: shopsEntity.items![index]);
                    }));
                  },
                  item: item,
                ),
              );
            },
          );
  }
}
