import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/common/app_colors.dart';

class CustomRatingBarWidget extends StatelessWidget {
  final double rate;
  final double itemSize;
  final Function(double)? onRatingUpdate;
  const CustomRatingBarWidget(
      {Key? key,
      required this.rate,
      required this.itemSize,
      this.onRatingUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: itemSize,
      initialRating: rate,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      textDirection: TextDirection.ltr,
      itemCount: 5,
      unratedColor: AppColors.white,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: AppColors.accentColorLight,
      ),
      onRatingUpdate: (double value) {
        if (onRatingUpdate != null) onRatingUpdate!(value);
      },
    );
  }
}
