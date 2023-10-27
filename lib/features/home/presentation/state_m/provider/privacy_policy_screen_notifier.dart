import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';

class PrivacyPolicyScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  String _privacyPolicyPhrase =
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ip sum dolor.';

  String get privacyPolicyPhrase => _privacyPolicyPhrase;

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
