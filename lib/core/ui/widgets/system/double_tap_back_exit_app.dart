import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../generated/l10n.dart';
import '../../toast.dart';

class DoubleTapBackExitApp extends StatefulWidget {
  const DoubleTapBackExitApp({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 2500),
  }) : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  _DoubleTapBackExitAppState createState() => _DoubleTapBackExitAppState();
}

class _DoubleTapBackExitAppState extends State<DoubleTapBackExitApp> {
  DateTime _lastTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _isExit(context),
      child: widget.child,
    );
  }

  Future<bool> _isExit(BuildContext context) async {
    if (DateTime.now().difference(_lastTime) > widget.duration) {
      _lastTime = DateTime.now();
      Toast.show(Translation.of(context).pressTwiceToExit);
      return Future.value(false);
    }
    // Toast.cancelToast();
    await SystemNavigator.pop();
    return Future.value(true);
  }
}
