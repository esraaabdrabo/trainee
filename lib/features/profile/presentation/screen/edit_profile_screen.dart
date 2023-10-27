import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/ui/widgets/custom_appbar.dart';
import '../../../../generated/l10n.dart';
import '../screen/../state_m/provider/edit_profile_screen_notifier.dart';
import 'edit_profile_screen_content.dart';



class EditProfileScreen extends StatefulWidget {
  static const String routeName = "/EditProfileScreen";

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final sn = EditProfileScreenNotifier();

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
       return ChangeNotifierProvider<EditProfileScreenNotifier>.value(
        value: sn,
        child: Scaffold(
          appBar: TransparentAppBar(title: Translation.of(context).edit_profile,),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: const EditProfileScreenContent(),
      ),
      );
    }


}
  

 


