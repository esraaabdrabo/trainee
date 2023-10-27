import 'package:flutter/material.dart';
import '../../../core/common/style/text_styles.dart';
import '../../../di/service_locator.dart';

class MoreItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onPressed;

  const MoreItem({
    Key? key,
    required this.image,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            shadowColor: Colors.transparent,
            onSurface: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: onPressed ?? () {},
          child: ListTile(
            leading: Image.asset(
              image,
              color: Theme.of(context).primaryColor,
              height: 30,
            ),
            title: Text(
              title,
              textScaleFactor: 1.0,
              style: getIt<AppTextStyles>().headline5,
            ),
          ),
        ),
        const Divider(
          indent: 1,
        ),
      ],
    );
  }
}
