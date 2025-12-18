/// Enum representing special day classifications relative to today.
enum SpecialDay {
  /// The date is today
  isToday,

  /// The date is yesterday
  isYesterday,

  /// The date is tomorrow
  isTomorrow,

  /// The date is neither today, yesterday, nor tomorrow
  noSpecialDay,
}

/// Utility class for date normalization and manipulation operations.
class DateUtils {
  DateUtils._();

  /// Normalizes a [DateTime] to the start of the day (midnight) in local timezone.
  ///
  /// This method removes the time component, setting hours, minutes, seconds,
  /// milliseconds, and microseconds to zero. This is useful for:
  /// - Grouping items by day regardless of their time
  /// - Comparing dates without considering time
  /// - Creating consistent date keys for maps
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2024, 1, 15, 14, 30, 45);
  /// final normalized = DateUtils.normalizeToDay(dateTime);
  /// // Result: DateTime(2024, 1, 15, 0, 0, 0)
  /// ```
  ///
  /// Returns a new [DateTime] instance with only the date component preserved.
  static DateTime normalizeToDay(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  /// Normalizes a [DateTime] to the start of the day, handling null values.
  ///
  /// Returns `null` if [dateTime] is `null`, otherwise returns the normalized date.
  static DateTime? normalizeToDayOrNull(DateTime? dateTime) {
    return dateTime == null ? null : normalizeToDay(dateTime);
  }

  /// Checks if two [DateTime] objects represent the same day.
  ///
  /// This method normalizes both dates and compares them, ignoring time components.
  ///
  /// Example:
  /// ```dart
  /// final date1 = DateTime(2024, 1, 15, 10, 30);
  /// final date2 = DateTime(2024, 1, 15, 22, 45);
  /// DateUtils.isSameDay(date1, date2); // Returns true
  /// ```
  static bool isSameDay(DateTime date1, DateTime date2) {
    return normalizeToDay(date1).isAtSameMomentAs(normalizeToDay(date2));
  }

  /// Classifies a [DateTime] as a special day relative to today.
  ///
  /// Returns [SpecialDay.isToday] if the date is today,
  /// [SpecialDay.isYesterday] if it's yesterday,
  /// [SpecialDay.isTomorrow] if it's tomorrow,
  /// or [SpecialDay.noSpecialDay] otherwise.
  ///
  /// Example:
  /// ```dart
  /// final today = DateTime.now();
  /// final yesterday = today.subtract(const Duration(days: 1));
  /// final tomorrow = today.add(const Duration(days: 1));
  /// final nextWeek = today.add(const Duration(days: 7));
  ///
  /// DateUtils.getSpecialDay(today);     // Returns SpecialDay.isToday
  /// DateUtils.getSpecialDay(yesterday);  // Returns SpecialDay.isYesterday
  /// DateUtils.getSpecialDay(tomorrow);  // Returns SpecialDay.isTomorrow
  /// DateUtils.getSpecialDay(nextWeek);  // Returns SpecialDay.noSpecialDay
  /// ```
  static SpecialDay getSpecialDay(DateTime dateTime) {
    final normalizedDate = normalizeToDay(dateTime);
    final normalizedToday = normalizeToDay(DateTime.now());
    final difference = normalizedDate.difference(normalizedToday).inDays;

    switch (difference) {
      case 0:
        return SpecialDay.isToday;
      case -1:
        return SpecialDay.isYesterday;
      case 1:
        return SpecialDay.isTomorrow;
      default:
        return SpecialDay.noSpecialDay;
    }
  }

  /// Checks if the given [DateTime] is today.
  ///
  /// Example:
  /// ```dart
  /// DateUtils.isToday(DateTime.now()); // Returns true
  /// DateUtils.isToday(DateTime.now().add(const Duration(days: 1))); // Returns false
  /// ```
  static bool isToday(DateTime dateTime) {
    return getSpecialDay(dateTime) == SpecialDay.isToday;
  }

  /// Checks if the given [DateTime] is yesterday.
  ///
  /// Example:
  /// ```dart
  /// final yesterday = DateTime.now().subtract(const Duration(days: 1));
  /// DateUtils.isYesterday(yesterday); // Returns true
  /// DateUtils.isYesterday(DateTime.now()); // Returns false
  /// ```
  static bool isYesterday(DateTime dateTime) {
    return getSpecialDay(dateTime) == SpecialDay.isYesterday;
  }

  /// Checks if the given [DateTime] is tomorrow.
  ///
  /// Example:
  /// ```dart
  /// final tomorrow = DateTime.now().add(const Duration(days: 1));
  /// DateUtils.isTomorrow(tomorrow); // Returns true
  /// DateUtils.isTomorrow(DateTime.now()); // Returns false
  /// ```
  static bool isTomorrow(DateTime dateTime) {
    return getSpecialDay(dateTime) == SpecialDay.isTomorrow;
  }

  /// Checks if the given [DateTime] is a special day (today, yesterday, or tomorrow).
  ///
  /// Example:
  /// ```dart
  /// DateUtils.isSpecialDay(DateTime.now()); // Returns true
  /// DateUtils.isSpecialDay(DateTime.now().add(const Duration(days: 7))); // Returns false
  /// ```
  static bool isSpecialDay(DateTime dateTime) {
    final specialDay = getSpecialDay(dateTime);
    return specialDay != SpecialDay.noSpecialDay;
  }
}
