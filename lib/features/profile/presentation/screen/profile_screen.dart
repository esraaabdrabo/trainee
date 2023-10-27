import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/app_colors.dart';
import '../../../../core/common/style/gaps.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../generated/l10n.dart';
import '../../../notification/presentation/view/notification_screen.dart';
import '../screen/../state_m/provider/profile_screen_notifier.dart';
import 'edit_profile_screen.dart';
import 'profile_screen_content.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "/ProfileScreen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final sn = ProfileScreenNotifier();

  @override
  void initState() {
    sn.profileCubit.getProfile();
    sn.profileCubit.getUsercurrentCourses();
    sn.profileCubit.getUserFinishedCourses();
    super.initState();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileScreenNotifier>.value(
      value: sn,
      child: Scaffold(
        appBar: TransparentAppBar(
          title: Translation.of(context).welcome,
          actions: [
            GestureDetector(
                onTap: () {
                  Nav.to(EditProfileScreen.routeName,context: context);
                },
                child: const ImageIcon(AssetImage(AppConstants.EDIT_PROFILE_ICON))),
            Gaps.hGap16,
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
              },
              child: const Icon(
                Icons.notifications,
                color: AppColors.white,
              ),
            ),
            Gaps.hGap20,
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ProfileScreenContent(),
      ),
    );
  }
}
