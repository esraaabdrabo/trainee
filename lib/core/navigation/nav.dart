import 'package:flutter/material.dart';

import '../../di/service_locator.dart';
import 'navigation_service.dart';

/// Class to make navigation calling shorter and faster to use
class Nav {
  /// Push
  static Future<T?> to<T extends Object?>(
    String routeName, {
   required BuildContext? context,
    Object? arguments,
  }) {
    return Navigator.pushNamed(
      context ?? getIt<NavigationService>().appContext!,
      routeName,
      arguments: arguments,
    );
  }

  /// Push replacement
  static Future<T?> off<T extends Object?, TO extends Object?>(
    String routeName, {
    required BuildContext? context,
    TO? result,
    bool cleanHistory = false,
    Object? arguments,
  }) {
    if (cleanHistory) {
      return Navigator.pushNamedAndRemoveUntil(
          context ?? getIt<NavigationService>().appContext!,
          routeName,
          (route) => false,
          arguments: arguments);
    } else
    {  return Navigator.pushReplacementNamed(
        context ?? getIt<NavigationService>().appContext!,
        routeName,
        result: result,
        arguments: arguments,
      );}
  }

  /// Pop
  static void pop<T extends Object?>([  BuildContext? context, T? result]) {
    if (Navigator.canPop(context ?? getIt<NavigationService>().appContext!))
      Navigator.pop(context ?? getIt<NavigationService>().appContext!, result);
    else
      throw Exception("Can't go back to the previous screen");
  }

  static String? getCurrentPath({required BuildContext context}) {
    return ModalRoute.of(context)?.settings.name;
  }

  /// Pop until
  static void popTo(bool Function(Route<dynamic>) predicate,
      {required BuildContext? context}) {
    Navigator.popUntil(
        context ?? getIt<NavigationService>().appContext!, predicate);
  }
}
