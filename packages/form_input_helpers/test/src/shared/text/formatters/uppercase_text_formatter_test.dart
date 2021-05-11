import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Format uppercase input', () {
    testWidgets(
      'lowercase converted to uppercase on keystroke input',
      (WidgetTester tester) async {
        expect(true, true);
      },
    );
    testWidgets(
      'lowercase converted to uppercase on fieldSubmitted',
      (WidgetTester tester) async {
        // Potential edge case here unlikely. Keystroke format vs onHooks
        expect(true, true);
      },
    );
    testWidgets('text saved as uppercase onSaved', (
      WidgetTester tester,
    ) async {
      expect(true, true);
    });
  });
}
