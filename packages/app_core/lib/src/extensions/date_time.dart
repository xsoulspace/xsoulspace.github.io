import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

DateTime dateTimeNowUtc() => DateTime.now().toUtc();

extension DateTimeExtension on DateTime {
  String format({final String pattern = 'dd/MM/yyyy', final String? locale}) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String formatYYMMDD([final String? locale]) =>
      toLocal().format(pattern: 'yyyy.MM.dd', locale: locale);
}
