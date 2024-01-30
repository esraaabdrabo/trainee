import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/common/app_colors.dart';
import 'package:upgrade_traine_project/features/coach/domain/entity/coach_entity.dart';
import '../screen/../state_m/provider/coach_profile_screen_notifier.dart';
import 'coach_profile_screen_content.dart';

class CoachProfileScreen extends StatefulWidget {
  final CoachEntity coachModel;
  static const String routeName = "/CoachProfileScreen";

  const CoachProfileScreen({Key? key, required this.coachModel})
      : super(key: key);

  @override
  _CoachProfileScreenState createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {
  late final sn;

  @override
  void initState() {
    super.initState();
    sn = CoachProfileScreenNotifier(widget.coachModel);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CoachProfileScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        //this app bar is used onlt of the back button
        appBar: AppBar(
          iconTheme:const IconThemeData(color: AppColors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const CoachProfileScreenContent(),
      ),
    );
  }
}
