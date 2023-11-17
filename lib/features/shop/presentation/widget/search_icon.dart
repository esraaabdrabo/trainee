import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/features/shop/presentation/state_m/cubit/shop_cubit.dart';

class AllShopsSearchIcon extends StatelessWidget {
  const AllShopsSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
      return IconButton(
          onPressed: () => BlocProvider.of<ShopCubit>(context).showSearchForm(),
          icon: const Icon(Icons.search));
    });
  }
}
