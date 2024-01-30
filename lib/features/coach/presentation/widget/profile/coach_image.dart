//todo refactoring
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrade_traine_project/core/utils/validators/error_image.dart';
import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';

class CoachProfileImage extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final CoachEntity coachModel;
  final Widget child;

  CoachProfileImage({
    required this.child,
    required this.coachModel,
    required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset / 1.1.h;
    final cardTopPosition = expandedHeight - 30.h - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    final appBarSize2 = expandedHeight - shrinkOffset / 2.5.h;
    final proportion2 = 2 - (expandedHeight / appBarSize2);
    final percent2 = proportion2 < 0 || proportion2 > 1 ? 0.0 : proportion2;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Center(
          child: Opacity(
            opacity: percent2,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.network(
                  coachModel.imageUrl ?? "",
                  fit: BoxFit.cover,
                  height: .15.sh,
                  errorBuilder: (context, error, stackTrace) =>
                      const ErrorImage(),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Colors.white.withOpacity(.1),
                        Colors.black.withOpacity(.35)
                      ])),
                  width: 1.sw,
                  height: .5.sh,
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: percent == 0 ? false : true,
          child: Opacity(
            opacity: percent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w * percent),
              child: child,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
