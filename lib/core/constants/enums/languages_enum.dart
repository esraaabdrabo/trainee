
import '../app/app_constants.dart';

enum LanguagesEnum { english, arabic }

LanguagesEnum mapStringToLanguagesEnum(String language) {
  if (language == AppConstants.LANG_EN) return LanguagesEnum.english;
  if (language == AppConstants.LANG_AR) return LanguagesEnum.arabic;

  /// Fallback
  return LanguagesEnum.english;
}

String mapLanguageEnumToString(LanguagesEnum language) {
  switch (language) {
    case LanguagesEnum.english:
      return AppConstants.LANG_EN;
    case LanguagesEnum.arabic:
      return AppConstants.LANG_AR;
    default:
      return AppConstants.LANG_EN;
  }
}
