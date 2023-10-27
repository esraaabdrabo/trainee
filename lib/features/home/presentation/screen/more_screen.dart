import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/enums/languages_enum.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/more_screen_notifier.dart';
import 'more_screen_content.dart';

class MoreScreen extends StatefulWidget {
  static const String routeName = "/MoreScreen";

  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final sn = MoreScreenNotifier();

  @override
  void initState() {
    super.initState();

    if (Intl().locale.contains(AppConstants.LANG_EN)) {
      sn.languagesEnum = LanguagesEnum.english;
    } else if (Intl().locale.contains(AppConstants.LANG_AR)) {
      sn.languagesEnum = LanguagesEnum.arabic;
    } else {
      sn.languagesEnum = LanguagesEnum.arabic;
    }
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoreScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).more,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: MoreScreenContent(),
      ),
    );
  }
}
