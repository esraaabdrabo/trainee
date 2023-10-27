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

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static hasCharacters(String text) {
    String modText = text.replaceAll(" ", "");
    return modText.length > 0;
  }

  static bool isValidPinCode(String text) {
    return text.length == 6;
  }

  static isValidPassword(String password) {
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
}
