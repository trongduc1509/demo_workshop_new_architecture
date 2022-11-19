import 'package:intl/intl.dart';

class Formatter {
  static final _format = DateFormat('yyyy-MM-dd');

  static String formatDateTime(DateTime? date) =>
      date == null ? '' : _format.format(date);

  static DateTime? toDateTime(String? date) {
    if (date == null) {
      return null;
    } else {
      try {
        return DateTime.parse(date);
      } catch (e) {
        return _format.parse(date);
      }
    }
  }
}
