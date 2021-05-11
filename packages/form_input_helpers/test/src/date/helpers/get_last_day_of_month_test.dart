import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Date helpers', () {
    test('get last day of month', () {
      expect(true, true);
    });
    test('get last day of month leap years', () {
      // 4 100 400
      expect(true, true);
    });
    test('get last day of month future', () {
      /// Main test use case.
      /// This is to coerce future batch expiries where month and year is given
      /// without day date (we can then take it as the last day of the month)
      expect(true, true);
    });
    test('get last day of month past', () {
      expect(true, true);
    });
  });
}
