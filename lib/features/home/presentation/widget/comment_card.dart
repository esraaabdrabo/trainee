import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/responsive/responsive_widget.dart';
import '../../../../core/common/style/gaps.dart';

class CommentCardMobile extends StatelessWidget {
  final String? name, body, email;
  final VoidCallback? onTap;

  const CommentCardMobile(
      {Key? key, this.name, this.body, this.email, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, sizindInfo, orientation) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: InkWell(
            onTap: () => this.onTap?.call(),
            child: _bulidContent(),
          ),
        );
      },
    );
  }

  /// Widget

  Widget _bulidContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildName(),
        Gaps.vGap24,
        buildBody(),
        Gaps.vGap24,
        buildEmail(),
      ],
    );
  }

  Widget _buildName() {
    return Text(
      "${name ?? ""}",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildBody() {
    return Text("${body ?? ""}");
  }

  Widget buildEmail() {
    return Text(
      "${email ?? ""}",
      style: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
