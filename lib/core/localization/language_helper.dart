import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:upgrade_traine_project/core/constants/app/app_constants.dart';
import 'package:upgrade_traine_project/core/datasources/shared_preference.dart';
import 'package:upgrade_traine_project/core/localization/flutter_localization.dart';

abstract class LanguageHelper {
  static AppLocalizations tr(BuildContext context) =>
      AppLocalizations.of(context)!;
  static bool isAr(BuildContext cnt) =>
      Provider.of<LocalizationProvider>(cnt).currentLanguage == 'ar';

  static Future<bool> isArCached() async {
    var prefs = await SpUtil.getInstance();

    return AppConstants.LANG_AR == prefs.getString(AppConstants.KEY_LANGUAGE);
  }
}
