import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// [ResponsiveWidget] is a widget to add the orientation value for -
/// [ResponsiveBuilder] that has no orientation param
class ResponsiveWidget extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
    Orientation oreintation,
  ) builder;

  const ResponsiveWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        return this.builder(
          context,
          sizingInfo,
          MediaQuery.of(context).orientation,
        );
      },
    );
  }
}
