import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/common/utils.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/navigation/nav.dart';
import 'package:upgrade_traine_project/features/home/presentation/screen/home_screen/home_screen_content.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/provider/home_screen_notifier.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/home_sections/section.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/shimmer/section_shimmer.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/all_restaurants.dart';
import 'package:upgrade_traine_project/features/shop/presentation/screen/shop_details.dart';
import 'package:upgrade_traine_project/features/shop/presentation/screen/shops_view.dart';
import 'package:upgrade_traine_project/features/shop/presentation/state_m/cubit/shop_cubit.dart';

class HomeShopsSection extends StatefulWidget {
  const HomeShopsSection({super.key});

  @override
  State<HomeShopsSection> createState() => _HomeShopsSectionState();
}

class _HomeShopsSectionState extends State<HomeShopsSection> {
  late HomeScreenNotifier sn;

  @override
  Widget build(BuildContext context) {
    sn = Provider.of<HomeScreenNotifier>(context);
    sn.context = context;
    void goToShops() {
      Nav.to(ShopsView.routeName, context: context);
    }

    return BlocBuilder<ShopCubit, ShopState>(
      bloc: sn.shopCubit,
      builder: (context, state) {
        return state.when(
          hideSearch: () => const SizedBox(),
          showSearch: () => const SizedBox(),
          shopInitState: () {
            return const SizedBox.shrink();
          },
          shopLoadingState: () {
            return const SectionShimmerWidget();
          },
          shopErrorState: (error, callback) {
            return const SizedBox.shrink();
          },
          getShopsState: (shopsEntity) {
            final List<TempWidget> categories0 = [];
            shopsEntity.items?.forEach((element) {
              categories0.add(TempWidget(
                id: element.id ?? 0,
                imgPath: element.cover ?? '',
                title: getTranslation(
                    context: context,
                    arText: element.arName,
                    enText: element.enName,
                    alternativeText: element.name),
                description: getTranslation(
                    context: context,
                    alternativeText: element.description,
                    enText: element.enDescription,
                    arText: element.arDescription),
              ));
            });
            return SizedBox(
              width: 1.sw,
              height: 0.38.sh,
              child: HomeSectionWidget(
                tempImage: AppConstants.defaultShopImage,
                title: LanguageHelper.tr(context).food_supplements,
                widgets: categories0,
                onSeeAllTapped: () => goToShops(),
                onItemSelected: (index) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ShopDetails(shopsEntity: shopsEntity.items![index]);
                  }));
                },
              ),
            );
          },
        );
      },
    );
  }
}
