import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app/app_constants.dart';

class Translations {
  final Locale? locale;

  Translations(this.locale);

  static const LocalizationsDelegate<Translations> delegate =
      _AppLocalizationsDelegate();

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/locales/${locale?.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    if (_localizedStrings == null) return '';
    return _localizedStrings?[key] ?? '** $key not found.';
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate extends LocalizationsDelegate<Translations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return [AppConstants.LANG_EN, AppConstants.LANG_AR]
        .contains(locale.languageCode);
  }

  @override
  Future<Translations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    Translations localizations = new Translations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
