import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';

List<String> genderList(BuildContext cnt) =>
    [LanguageHelper.tr(cnt).male, LanguageHelper.tr(cnt).female];
