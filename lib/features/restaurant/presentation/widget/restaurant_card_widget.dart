import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/features/restaurant/domain/entity/restaurant_entity.dart';
import 'package:upgrade_traine_project/features/restaurant/presentation/screen/restaurant_view.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/constants/app/app_constants.dart';

class RestaurantAndShopsCardShow extends StatelessWidget {
  final PartnerEntity item;
  final Function()? onTap;

  const RestaurantAndShopsCardShow({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 356,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
        ),
        width: double.infinity,
        child: Column(
          children: [
            _CoverImage(item: item),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  color: AppColors.darkGrey,
                ),
                child: ListTileCustomWidget(
                  body: LanguageHelper.isAr(context)
                      ? item.arDescription ??
                          LanguageHelper.tr(context).no_data_found
                      : item.enDescription ??
                          LanguageHelper.tr(context).no_data_found,
                  title: LanguageHelper.isAr(context)
                      ? item.arName ?? LanguageHelper.tr(context).no_data_found
                      : item.enName ?? LanguageHelper.tr(context).no_data_found,
                  avatarImage: item.logo == null
                      ? item is RestaurantEntity
                          ? defaultRestImg
                          : defaultShopImg
                      : item.logo!,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({
    super.key,
    required this.item,
  });

  final PartnerEntity item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(item.cover == null || item.cover!.isEmpty
                    ? item is RestaurantEntity
                        ? defaultRestImg
                        : defaultShopImg
                    : item.cover!))),
      ),
    );
  }
}

class ListTileCustomWidget extends StatelessWidget {
  final String title;
  final String body;
  final String avatarImage;

  const ListTileCustomWidget({
    Key? key,
    required this.avatarImage,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(avatarImage),
          radius: .06.sw,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: .65.sw,
                child: Text(
                  title,
                  style: TextStyle(
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w500,
                      fontSize: AppConstants.textSize14,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              SizedBox(
                width: .65.sw,
                child: Text(
                  body,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstants.textSize12,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
