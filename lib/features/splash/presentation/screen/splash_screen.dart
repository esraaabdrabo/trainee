// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/features/splash/presentation/screen/splash_screen_content.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/session_data.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/datasources/shared_preference.dart';
import '../../../../core/navigation/nav.dart';
import '../../../home/presentation/screen/navigator_screen.dart';
import '../../../home/presentation/state_m/bloc/home_cubit.dart';
import '../../../home/presentation/state_m/provider/home_screen_notifier.dart';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/SplashScreen";

  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final sn = HomeScreenNotifier();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      sn.homeCubit.getSpecializations();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColorLight,
        body: BlocListener<HomeCubit, HomeState>(
          bloc: sn.homeCubit,
          listener: (context, state) {
            debugPrint("state:$state");
            _handleOnSplashLoaded();
          },
          child: SplashScreenContent(),
        ));
  }

  void _handleOnSplashLoaded() async {
    var prefs = await SpUtil.getInstance();
    double? longitude = prefs.getDouble(AppConstants.KEY_LONGITUDE);
    double? latitude = prefs.getDouble(AppConstants.KEY_LATITUDE);
    if (longitude != null && latitude != null) {
      LatLng latLng = LatLng(latitude, longitude);
      Provider.of<SessionDataProvider>(context, listen: false).myLocation =
          latLng;
    }
    debugPrint("Errr");
    debugPrint("Errr${prefs.getString(AppConstants.KEY_TOKEN)}");
    if (prefs.getString(AppConstants.KEY_TOKEN) != null) {
      Nav.off(NavigatorScreen.routeName, cleanHistory: true, context: context);
    } else {
      Navigator.pushNamed(context, IntroScreen.routeName);
    }
  }
}
