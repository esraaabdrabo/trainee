import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/common/app_colors.dart';
import '../../constants/app/app_constants.dart';

class CustomImageWidget extends StatelessWidget {
  final String imgPath;
  final double? width;
  final double? height;
  final Widget? child;
  final String? tempImage;
  const CustomImageWidget(
      {Key? key,
      required this.imgPath,
      this.width,
      this.height,
      this.child,
      this.tempImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgPath,
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? 1.sw,
        height: height ?? 1.sh,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
      placeholder: (context, url) => Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.lightGrey,
          child: Container(
            width: width ?? 1.sw,
            height: height ?? 1.sh,
            color: AppColors.grey,
          )),
      errorWidget: (context, url, error) => Container(
          width: width ?? 1.sw,
          height: height ?? 1.sh,
          decoration: BoxDecoration(
              color: AppColors.grey,
              image: DecorationImage(image: _getImage(tempImage).image)),
          child: child),
    );
  }
}

Image _getImage(String? tempImage) {
  if (tempImage == null) return Image.asset(AppConstants.APP_LOGO_IMG);
  final RegExp urlRegExp = RegExp(
    r'^(?:http|https):\/\/[\w\-]+(?:\.[\w\-]+)+[\w\-.,@?^=%&:/~\+#]*[\w\-@?^=%&/~\+#]$',
    caseSensitive: false,
  );

  if (urlRegExp.hasMatch(tempImage)) {
    return Image.network(tempImage);
  } else {
    return Image.asset(tempImage);
  }
}
