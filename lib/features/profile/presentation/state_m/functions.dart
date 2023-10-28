abstract class EdirProfileFunctions {
  static bool isNull(String? value) {
    return value == null || value.toLowerCase() == "null";
  }
}
