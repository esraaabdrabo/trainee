import 'package:intl/intl.dart';

/// Translations in application code where no context exist, translation should
/// be entered manually, so when adding new language be sure the new translation
/// in this language has been added here
class CustomLocalization {
  static String get notValidResponse {
    switch(Intl.getCurrentLocale()){
      case 'ar':
        return "جواب المخدم غير مطابق";
      case 'en':
        return "Not valid response";
    }

    return "Not valid response";
  }

  static String get generalErrorMessage {
    switch(Intl.getCurrentLocale()){
      case 'ar':
        return 'حدث خطأ ما. يرجى المحاولة لاحقاً';
      case 'en':
        return "An error has occurred. Please try again later";
    }
    return "An error has occurred. Please try again later";
  }

  static String get cancelErrorMessage {
    switch(Intl.getCurrentLocale()){
      case 'ar':
        return 'تمت مفاطعة الاتصال';
      case 'en':
        return 'The connection has been interrupted';
    }

    return 'The connection has been interrupted';
  }
}