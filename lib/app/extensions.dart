import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get capitalize {
    if (length == 0) {
      return this;
    } else if (length == 1) {
      return toUpperCase();
    } else {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
  }
}

extension DateExtension on DateTime {
  String get formatted {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 60) {
      return "Just now";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes}m ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}hr ago";
    } else {
      return DateFormat.yMd().format(this);
    }
  }
}