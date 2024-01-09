import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/navigation/nav.dart';
import 'package:upgrade_traine_project/features/category/presentation/screen/category_list_screen.dart';
import 'package:upgrade_traine_project/features/coach/presentation/screen/coaches_list_screen.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/more/chip.dart';
import 'package:upgrade_traine_project/features/orders/presenation/screens/cart_view.dart';
import 'package:upgrade_traine_project/features/orders/presenation/screens/order_screen.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/all_restaurants.dart';
import 'package:upgrade_traine_project/features/shop/presentation/screen/shops_view.dart';

class MoreScreenSections extends StatelessWidget {
  const MoreScreenSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40.w,
      runSpacing: 16.h,
      children: List.generate(
        6,
        (index) => CustomChipWidget(
          imgPath: _getIcon(index),
          onPressed: _getOnPress(index, context),
          title: _getTitle(context, index),
        ),
      ),
    );
  }

  String _getTitle(BuildContext context, int index) {
    return [
      LanguageHelper.tr(context).categories,
      LanguageHelper.tr(context).coaches,
      LanguageHelper.tr(context).restaurants,
      LanguageHelper.tr(context).supplements_shops,
      LanguageHelper.tr(context).my_orders,
      LanguageHelper.tr(context).cart
    ][index];
  }

  String _getIcon(int index) {
    return [
      AppConstants.SWIMMING_IMG,
      AppConstants.COACH1_IMAGE,
      AppConstants.MOTCHY2_IMG,
      AppConstants.VEGGIE2_IMG,
      AppConstants.VEGGIE_IMG,
      AppConstants.VEGGIE2_IMG
    ][index];
  }

  Function _getOnPress(int index, BuildContext context) {
    return [5, 4].contains(index)
        ? () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  index == 4 ? const MyOrderView() : CartView(),
            ))
        : () => Nav.to(
            [
              CategoryListScreen.routeName,
              CoachesListScreen.routeName,
              RestaurantView.routeName,
              ShopsView.routeName,
            ][index],
            context: context);
  }
}
