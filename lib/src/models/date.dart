class Date extends DateTime {
  Date({
    int day = 01,
    int month = 01,
    int year = 1999,
  }) : super(year, month, day);

  static Date tryParse(String formattedString) {
    if (formattedString == null || formattedString.isEmpty) return null;

    DateTime dateTime = DateTime.tryParse(formattedString);
    return Date(day: dateTime.day, month: dateTime.month, year: dateTime.year);
  }

  static String _fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";
    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >= 10) return "${sign}00$absN";
    return "${sign}000$absN";
  }

  static String _twoDigits(int n) {
    if (n >= 10) return "${n}";
    return "0${n}";
  }

  @override
  String toString() =>
      "${_fourDigits(year)}-${_twoDigits(month)}-${_twoDigits(day)}";
}
