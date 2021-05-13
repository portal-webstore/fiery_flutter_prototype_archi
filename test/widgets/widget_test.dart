// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:authentication_repository/authentication_repository.dart'
    show FirebaseAuthenticationRepository;
import 'package:fiery_flutter_prototype_archi/app.dart' show WebstoreApp;
import 'package:fiery_flutter_prototype_archi/home/keys/home_keys.dart'
    show HomeKeys;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Menu is clickable', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    /// Check whether we simply mock this or use the non-firebase local mock
    /// implementation to provide uid and things or use firebase local
    /// emulator
    final FirebaseAuthenticationRepository firebaseAuthenticationRepository =
        FirebaseAuthenticationRepository();
    await firebaseAuthenticationRepository.user.first;

    await tester.pumpWidget(
      WebstoreApp(
        authenticationRepository: firebaseAuthenticationRepository,
      ),
    );

    // Find a menu on home app screen.
    expect(find.byIcon(Icons.menu), findsOneWidget);

    await tester.tap(find.byKey(HomeKeys.menuKey));

    await tester.pump();
  });
}
