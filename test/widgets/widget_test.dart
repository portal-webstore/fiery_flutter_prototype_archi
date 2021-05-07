// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fiery_flutter_prototype_archi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Menu is clickable', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Find a menu on home app screen.
    expect(find.byIcon(Icons.menu), findsOneWidget);

    await tester.tap(find.byKey(const Key('__menu_button__')));
    await tester.pump();
  });
}
