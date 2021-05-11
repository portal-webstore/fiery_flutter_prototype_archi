import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validate empty input', () {
    test('disallows empty', () {
      expect(true, true);
    });

    test('disallows null', () {
      // ? Is this possible
      // At which part of field life cycle
      // We usually explicitly handle nulls
      expect(true, true);
    });
  });
}
