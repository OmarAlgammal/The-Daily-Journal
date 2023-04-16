import 'package:intl/intl.dart';

class DateFactory {
  static String calculateElapsedTime({required DateTime date}) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes == 0) {
      return 'now';
    }

    if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    }

    if (difference.inDays < 30) {
      return '${difference.inDays}d ago';
    }

    final months = difference.inDays ~/ 30;
    if (months < 12) {
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    }

    final years = months ~/ 12;
    return '$years ${years == 1 ? 'year' : 'years'} ago';
  }

  static String formatDate(DateTime dateTime){
    return DateFormat.MMMd()
        .add_y()
        .format(dateTime)
        .toString();
  }
}
