import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  var _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get getNavigationKey => _navigationKey;

  GlobalKey<NavigatorState> get getNewNavigationKey {
    _navigationKey = GlobalKey<NavigatorState>();
    return _navigationKey;
  }

  BuildContext? get appContext {
    return this._navigationKey.currentContext;
  }

  pop() {
    return _navigationKey.currentState?.pop();
  }

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  void popAllAppNavigator() {
    if (_navigationKey.currentState?.canPop() ?? false) {
      _navigationKey.currentState?.popUntil((route) => route.isFirst);
    }
  }
}
