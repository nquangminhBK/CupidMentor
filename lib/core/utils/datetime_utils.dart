import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime convertToDateTime(String source) => DateFormat.yMd().parse(source);

  static String convertToString(DateTime dateTime) => DateFormat.yMd().format(dateTime);
}
