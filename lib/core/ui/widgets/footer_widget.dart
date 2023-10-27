import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../generated/l10n.dart';


class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      loadingText: "",
      noDataText: Translation.of(context).noDataRefresher,
      failedText: Translation.of(context).failedRefresher,
      idleText: "",
      canLoadingText: "",
    );
  }
}