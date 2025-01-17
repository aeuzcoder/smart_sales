extension StringExtensions on String {
  // Helper function to add spaces every 3 digits
  String get addThousandSeparators {
    var buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      // Insert a space after every 3 digits
      if (i != 0 && i % 3 == 0) {
        buffer.write(' ');
      }
      buffer.write(this[length - i - 1]); // Write digits in reverse
    }
    return buffer
        .toString()
        .split('')
        .reversed
        .join(''); // Reverse the string back
  }
}

extension IntExtensions on int {
  String get moneyType {
    switch(this) {
      case 0: return ' UZS';
      case 1: return '\$';
      default: return '';
    }
  }
}

extension DateExtensions on DateTime {
  String get toMonthName {
    switch (month) {
      case 1:
        return 'Yanvar';
      case 2:
        return 'Fevral';
      case 3:
        return 'Mart';
      case 4:
        return 'Aprel';
      case 5:
        return 'May';
      case 6:
        return 'Iyun';
      case 7:
        return 'Iyul';
      case 8:
        return 'Avgust';
      case 9:
        return 'Sentyabr';
      case 10:
        return 'Oktyabr';
      case 11:
        return 'Noyabr';
      case 12:
        return 'Dekabr';
      default:
        return '$month exception';
    }
  }

  String get toStringFormatted {
    return '$year.$month.$day';
  }
}
