import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/core/common/style/gaps.dart';
import 'package:upgrade_traine_project/features/home/presentation/widget/shimmer/container_item.dart';

class SectionShimmerWidget extends StatelessWidget {
  const SectionShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.38.sh,
      child: Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.lightGrey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShimmerContainerItem(height: 16.h, width: 0.2.sw),
                ],
              ),
              Gaps.vGap16,
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(child: ShimmerContainerItem()),
                    Gaps.hGap8,
                    Expanded(
                        child: Column(
                      children: [
                        const Expanded(child: ShimmerContainerItem()),
                        Gaps.vGap8,
                        const Expanded(child: ShimmerContainerItem()),
                      ],
                    )),
                  ],
                ),
              ),
              Gaps.vGap8,
              const Expanded(child: ShimmerContainerItem())
            ],
          )),
    );
  }
}
