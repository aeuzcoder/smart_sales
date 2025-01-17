import 'package:intl/intl.dart';

class Utils {
  static String formattingPrice(int? price) {
    return NumberFormat.decimalPattern('ru').format(price);
  }
}
