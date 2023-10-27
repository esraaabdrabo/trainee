import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/responsive/responsive_utils.dart';
import '../../../../core/common/responsive/responsive_widget.dart';

class CommentCardTablet extends StatelessWidget {
  final String? name, body, email;
  final double height;
  final double? width;
  final VoidCallback? onTap;

  const CommentCardTablet(
      {Key? key,
      this.name,
      this.body,
      this.email,
      required this.height,
      this.width,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, sizindInfo, orientation) {
      return Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          color: getValueForOrientation(
            context,
            portrait: Theme.of(context).colorScheme.secondary,
            landscape: Theme.of(context).hintColor,
          ),
          borderRadius: getValueForOrientation(
            context,
            portrait: BorderRadius.circular(20.r),
            landscape: null,
          ),
          shape: getValueForOrientation(
            context,
            portrait: BoxShape.rectangle,
            landscape: BoxShape.circle,
          )!,
        ),
        child: InkWell(onTap: () => this.onTap?.call(), child: _bulidContent()),
      );
    });
  }

  /// Widget

  Widget _bulidContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildName(),
        _buildBody(),
      ],
    );
  }

  Widget _buildName() {
    return Text("Name: ${name ?? ""}");
  }

  Widget _buildBody() {
    return Text("${body ?? ""}");
  }
}
