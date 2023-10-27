import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/feedback_screen_notifier.dart';
import 'feedback_screen_content.dart';

class FeedbackScreen extends StatefulWidget {
  static const String routeName = "/FeedbackScreen";

  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final sn = FeedbackScreenNotifier();

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
    return ChangeNotifierProvider<FeedbackScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).feedback,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: FeedbackScreenContent(),
      ),
    );
  }
}
