import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';

import '../../../../core/common/app_colors.dart';

class DishesView extends StatelessWidget {
  final String restaurantName;
  final String plateName;
  final String? imagePlate;
  final String price;
  final void Function()? onTap;

  const DishesView({
    Key? key,
    required this.price,
    required this.imagePlate,
    required this.restaurantName,
    required this.plateName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PlateName(plateName: plateName),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _RestaurantName(restaurantName: restaurantName),
                        _Price(price: price),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: .2.sh,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      imagePlate ??
                          "https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Price extends StatelessWidget {
  const _Price({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$price ${LanguageHelper.tr(context).saudi_riyal}",
      style: const TextStyle(color: Colors.grey, fontSize: 10),
    );
  }
}

class _RestaurantName extends StatelessWidget {
  const _RestaurantName({
    super.key,
    required this.restaurantName,
  });

  final String restaurantName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .18.sw,
      child: Text(
        restaurantName,
        maxLines: 1,
        style: const TextStyle(
            color: Colors.yellow,
            fontSize: 11,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}

class _PlateName extends StatelessWidget {
  const _PlateName({
    super.key,
    required this.plateName,
  });

  final String plateName;

  @override
  Widget build(BuildContext context) {
    return Text(
      plateName,
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 1,
    );
  }
}
