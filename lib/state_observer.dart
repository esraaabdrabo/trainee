import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrade_traine_project/features/chat/screen/agora/functions.dart';

class MyAppStateObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state);
    //if the application latest state is detached then it's terminated
    //will be used in background handler for fcm

    // Handle state changes (resumed, inactive, paused, etc.)
    if (state == AppLifecycleState.resumed) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.reload();
      //if this condition is true then it's indticates that the app has come from background

      // App is in the foreground from background
      await AgoraFunctions.handleNavigatingToAgora();
    } else if (state == AppLifecycleState.inactive) {
      // App is in an inactive state
    } else if (state == AppLifecycleState.paused) {
      // App is in the background
    } else if (state == AppLifecycleState.detached) {
      // App is terminated
    }
  }
}
