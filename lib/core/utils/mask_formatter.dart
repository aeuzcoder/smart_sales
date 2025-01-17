import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final MaskTextInputFormatter phoneMaskFormatter = MaskTextInputFormatter(
  mask: "## ### ## ##",
  filter: {"#": RegExp(r'[0-9]')},
);

final MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter(
  mask: "##.##.####",
  filter: {"#": RegExp(r'[0-9]')},
);

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all spaces from the input value
    String newText = newValue.text.replaceAll(' ', '');

    // Format the text by inserting a space every 3 digits
    String formattedText = _addThousandSeparators(newText);

    // Return the updated value, keeping the correct cursor position
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  // Helper function to add spaces every 3 digits
  String _addThousandSeparators(String value) {
    var buffer = StringBuffer();
    for (int i = 0; i < value.length; i++) {
      // Insert a space after every 3 digits
      if (i != 0 && i % 3 == 0) {
        buffer.write(' ');
      }
      buffer.write(value[value.length - i - 1]); // Write digits in reverse
    }
    return buffer
        .toString()
        .split('')
        .reversed
        .join(''); // Reverse the string back
  }
}
