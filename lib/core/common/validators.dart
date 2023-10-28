import 'package:flutter/material.dart';
import 'package:upgrade_traine_project/core/localization/language_helper.dart';

/// Regexes and validators that be used in text fields
class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^.{8,30}$',
  );

  static final RegExp _nameRegExp = RegExp(r'^(?!\s*$).+');
  static final RegExp _fullNameRegExp = RegExp(r'^(?!\s*$).+ (?!\s*$).+');

  static isNotEmptyString(String string) {
    return string.trim() != "";
  }

  static bool isLinkValid(String input) {
    // Regular expression to match URLs
    final urlRegExp = RegExp(
      r'^(https?|ftp)://[^\s/$.?#].[^\s]*$',
      caseSensitive: false,
    );

    return urlRegExp.hasMatch(input);
  }

  static String? isValidEmail(String email, BuildContext context) {
    return _emailRegExp.hasMatch(email)
        ? null
        : LanguageHelper.tr(context).invalid_email;
  }

  static hasCharacters(String text) {
    String modText = text.replaceAll(" ", "");
    return modText.isNotEmpty;
  }

  static bool isValidPinCode(String text) {
    return text.length == 6;
  }

  static bool isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  static isValidName(String name) {
    return _nameRegExp.hasMatch(name);
  }

  static isValidFullName(String name) {
    return _fullNameRegExp.hasMatch(name);
  }

  static isValidConfirmPassword(String password, String confirmPassword) {
    return (password == confirmPassword);
  }

  static isValidPhoneNumber(String phone) {
    return (phone.length >= 8 || phone.length <= 10);
  }

  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  static String? isNumber(String input, BuildContext context) {
    final regex = RegExp(r'^-?\d+(\.\d+)?$');
    return regex.hasMatch(input)
        ? null
        : LanguageHelper.tr(context).enter_num_only;
  }

  static bool isArabic(String input) {
    final regex = RegExp(
        r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');
    return regex.hasMatch(input);
  }

  static bool isEnglish(String input) {
    final regex = RegExp(r'[A-Za-z]');
    return regex.hasMatch(input);
  }
}
