import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:upgrade_traine_project/main.dart';

@lazySingleton
class NavigationService {
  GlobalKey<NavigatorState> get getNavigationKey => navigatorKey;

  BuildContext? get appContext {
    return navigatorKey.currentContext;
  }

  pop() {
    return navigatorKey.currentState?.pop();
  }

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  void popAllAppNavigator() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.popUntil((route) => route.isFirst);
    }
  }
}
