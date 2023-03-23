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
