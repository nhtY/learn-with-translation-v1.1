

extension StringExtention on String {
  String capitalize() {
    if (this == null || this == "") return "";

    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}