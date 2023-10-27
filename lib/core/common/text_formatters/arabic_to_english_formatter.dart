import 'package:flutter/services.dart';

/// Preventing type arabic numbers by automatically converting them to english
class ArabicToEnglishTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.selection.end;
    var input = newValue.text;
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return new TextEditingValue(
      text: input.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
