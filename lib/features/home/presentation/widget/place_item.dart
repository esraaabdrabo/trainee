import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import '../../data/model/request/place_suggestation.dart';

class PlaceItem extends StatelessWidget {
  final int index;
  final PlaceSuggestation suggestion;

  const PlaceItem({Key? key, required this.index, required this.suggestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = suggestion.description
        .replaceAll(suggestion.description.split(',')[0], '');
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          ListTile(
            leading: _Leading(),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${suggestion.description}',
                    style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: subTitle,
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: 14.sp,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  const _Leading();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: AppColors.lightGreyFontColor.withOpacity(.5),
        radius: 15.w,
        child: Icon(
          Icons.location_on,
          color: AppColors.white,
          size: 16.sp,
        ));
  }
}
