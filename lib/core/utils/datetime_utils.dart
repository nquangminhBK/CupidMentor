import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime convertToDateTime(String source) {
    return DateFormat.yMd().parse(source);
  }

  static String convertToString(DateTime dateTime) {
    return DateFormat.yMd().format(dateTime);
  }
}
