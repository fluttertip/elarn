import 'package:intl/intl.dart';

abstract final class AppFormatter {
  static String formatNumber(int value) => NumberFormat.compact().format(value);

  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (hours > 0) {
      return '$hours:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  static String formatDate(DateTime date) => DateFormat.yMMMd().format(date);
}
