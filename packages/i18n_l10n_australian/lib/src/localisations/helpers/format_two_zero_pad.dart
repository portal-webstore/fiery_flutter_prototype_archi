/// Formats [number] using two digits, assuming it's in the 0-99 inclusive
/// range. Not designed to format values outside this range.
String formatTwoDigitZeroPad(int number) {
  /// Common code convention prefers range notation as
  /// inclusive lower/starting bound and exclusive upper bound
  /// There is a large discussion on this; related
  /// https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html
  /// note: index, difference, count/length, non-overlapping consecutive ranges?
  /// left-closed right-open intervals make it easy to represent
  /// sub-intervals in the data structure, including the empty ones
  /// [0, 1)
  assert(0 <= number && number < 100);

  if (number < 10) return '0$number';

  return '$number';
}
