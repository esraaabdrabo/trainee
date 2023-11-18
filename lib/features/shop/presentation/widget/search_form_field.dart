import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_text_field.dart';
import 'package:upgrade_traine_project/core/ui/widgets/search_Form_filed/functions.dart';
import 'package:upgrade_traine_project/features/shop/data/model/request/get_shops_request.dart';
import 'package:upgrade_traine_project/features/shop/presentation/state_m/cubit/shop_cubit.dart';
import 'package:upgrade_traine_project/generated/l10n.dart';

class AllShopsSearchField extends StatelessWidget {
  const AllShopsSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      buildWhen: (previous, current) =>
          current is ShopshowSearchState || current is ShopHideSearchState,
      builder: (context, state) {
        if (state is ShopshowSearchState) {
          return SearchTextField(
              suffix: IconButton(
                  onPressed: () => _clearSearch(context),
                  icon: const Icon(Icons.cancel)),
              hintText: Translation.of(context).search,
              controller: BlocProvider.of<ShopCubit>(context).searchController,
              onChanged: (input) => SearchFunctions.onChangeHandler(
                  input, () => _handleSearch(input, context)));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

void _handleSearch(String input, BuildContext context) {
  BlocProvider.of<ShopCubit>(context)
      .getShops(GetShopsRequest(q: {"Keyword": input}));
}

void _clearSearch(BuildContext context) {
  BlocProvider.of<ShopCubit>(context).clearSearch();
}
