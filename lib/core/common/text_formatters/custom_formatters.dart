import 'dart:math';

import 'package:intl/intl.dart';

/// Various text formatters could be used in text fields
class Formatter {
  static RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static String Function(Match) mathFunc = (Match match) => '${match[1]},';

  static String formatNumber(double number) {
    return number.round().toString().replaceAllMapped(reg, mathFunc);
  }

  static double roundDoubleNum(int roundTo, num dnum) {
    int fac = pow(10, roundTo) as int;
    return ((dnum * fac).round() / fac);
  }

  static String? formatPhoneNumber(String? number) {
    if (number == null || number == "") return null;
    String? modNumber = number;
    String resPhone = '0';
    modNumber = modNumber.substring(1, modNumber.length);
    resPhone += modNumber[0] + modNumber[1] + modNumber[2] + '-';
    modNumber = modNumber.substring(3, modNumber.length);
    resPhone += modNumber.substring(0, 3) +
        '-' +
        modNumber.substring(3, modNumber.length);
    return resPhone;
  }

  static String formatter(String _price) {
    double value = double.parse(_price);

    final formatter = new NumberFormat("###,###.###", "en_US");

    String newText = formatter.format(value);

    /// This code replace , with . and vise versa
    // final String tempres = newText.replaceAll('.', ';');
    // newText = tempres.replaceAll(',', '.');
    // newText = newText.replaceAll(';', ',');

    return newText;
  }
}
