import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';

class ShimmerContainerItem extends StatelessWidget {
  const ShimmerContainerItem({this.height, this.width, super.key});
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius4),
        color: AppColors.grey,
      ),
      width: width,
      height: height,
    );
  }
}
