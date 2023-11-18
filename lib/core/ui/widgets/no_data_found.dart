import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(LanguageHelper.tr(context).no_data_found),
    );
  }
}
