import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWithBorderAndShadow extends StatelessWidget {
  final Color shadowColor;
  final double blurRadius;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;
  final double? cornerRadius;
  final bool? takesChildWidth;

  const ContainerWithBorderAndShadow({
    Key? key,
    this.shadowColor = Colors.grey,
    this.padding = const EdgeInsets.all(0),
    this.child,
    this.height,
    this.margin,
    this.cornerRadius,
    this.blurRadius = 10,
    this.width,
    this.takesChildWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: (takesChildWidth ?? false) ? null : width ?? 0.95.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(cornerRadius == null ? 25 : cornerRadius!),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: shadowColor,
            offset: const Offset(0, 0),
            spreadRadius: 1,
            blurRadius: blurRadius,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(cornerRadius == null ? 25 : cornerRadius!),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
