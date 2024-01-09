import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';
import 'package:upgrade_traine_project/core/ui/widgets/custom_appbar.dart';
import 'package:upgrade_traine_project/features/home/presentation/state_m/provider/privacy_policy_screen_notifier.dart';

import 'privacy_policy_screen_content.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static const String routeName = "/PrivacyPolicyScreen";

  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final sn = PrivacyPolicyScreenNotifier();

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
    return ChangeNotifierProvider<PrivacyPolicyScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: TransparentAppBar(
          title: LanguageHelper.tr(context).privacy_policy,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: PrivacyPolicyScreenContent(),
      ),
    );
  }
}
