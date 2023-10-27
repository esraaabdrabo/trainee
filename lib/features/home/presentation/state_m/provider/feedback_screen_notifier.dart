import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';

class FeedbackScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final FocusNode _subjectFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();

  /// Getters and Setters

  TextEditingController get subjectController => _subjectController;
  TextEditingController get detailsController => _detailsController;

  FocusNode get subjectFocusNode => _subjectFocusNode;
  FocusNode get detailsFocusNode => _detailsFocusNode;

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
