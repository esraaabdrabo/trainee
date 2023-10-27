import 'package:flutter/material.dart';

import '../../../../../core/common/costum_modules/screen_notifier.dart';
import '../../../../../core/constants/enums/languages_enum.dart';

class MoreScreenNotifier extends ScreenNotifier {
  /// Fields
  late BuildContext context;
  LanguagesEnum _languagesEnum = LanguagesEnum.english;

  LanguagesEnum get languagesEnum => _languagesEnum;

  set languagesEnum(LanguagesEnum value) {
    _languagesEnum = value;
    notifyListeners();
  }

  /// Getters and Setters

  /// Methods

  @override
  void closeNotifier() {
    this.dispose();
  }
}
