import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/constants/app/app_constants.dart';

class RestaurantAndShopsCardShow extends StatelessWidget {
  final String title;
  final String body;
  final String avatarImage;
  final String? coverImage;
  final Function()? onTap;

  const RestaurantAndShopsCardShow({
    Key? key,
    required this.title,
    required this.body,
    required this.avatarImage,
    required this.coverImage,
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
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                    image: coverImage == null
                        ? DecorationImage(
                            image: AssetImage(AppConstants.REGISTER_BACKGROUND))
                        : DecorationImage(image: NetworkImage(coverImage!))),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  color: AppColors.darkGrey,
                ),
                child: ListTileCustomWidget(
                  body: body,
                  title: title,
                  avatarImage: avatarImage,
                ),
              ),
            )
          ],
        ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: avatarImage == null
              ? CircleAvatar(
                  backgroundImage: AssetImage(AppConstants.PROFILE_ICON),
                  radius: 25,
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(avatarImage),
                  radius: 25,
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: TextStyle(
                    color: AppColors.yellow,
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstants.textSize14,
                    overflow: TextOverflow.ellipsis),
              ),
              Text(
                "$body",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: AppConstants.textSize12,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        )
      ],
    );
  }
}
