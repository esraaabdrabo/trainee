import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/about_app_screen_notifier.dart';
import 'about_app_screen_content.dart';

class AboutAppScreen extends StatefulWidget {
  static const String routeName = "/AboutAppScreen";

  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  final sn = AboutAppScreenNotifier();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AboutAppScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).about_app,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AboutAppScreenContent(),
      ),
    );
  }
}
