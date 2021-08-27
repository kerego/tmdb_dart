class Date extends DateTime {
  Date({
    int day = 01,
    int month = 01,
    int year = 1999,
  })  : assert(day > 0 && month > 0 && year > 0),
        super(year, month, day);

  static Date? tryParse(String? formattedString) {
    if (formattedString == null || formattedString.isEmpty) return null;

    DateTime? dateTime = DateTime.tryParse(formattedString);
    if (dateTime == null) return null;
    return Date(day: dateTime.day, month: dateTime.month, year: dateTime.year);
  }

  static String _fourDigits(int n) => n.toString().padLeft(4, '0');

  static String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  String toString() =>
      "${_fourDigits(year)}-${_twoDigits(month)}-${_twoDigits(day)}";
}
