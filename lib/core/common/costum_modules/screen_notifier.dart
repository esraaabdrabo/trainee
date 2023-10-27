import 'package:flutter/cupertino.dart';

abstract class ScreenNotifier extends ChangeNotifier {
  /// Use this function to dispose the notifier and any other streams
  void closeNotifier();
}
