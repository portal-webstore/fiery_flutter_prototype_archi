// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:authentication_repository/authentication_repository.dart'
    as authentication_repository show FirebaseAuthenticationRepository, User;
import 'package:bloc_test/bloc_test.dart';
import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart';
import 'package:fiery_flutter_prototype_archi/app/views/webstore_app.dart'
    show WebstoreApp;
import 'package:fiery_flutter_prototype_archi/app/views/webstore_app_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ignore: must_be_immutable, avoid_implementing_value_types
class MockUser extends Mock implements authentication_repository.User {}

class MockAuthenticationRepository extends Mock
    implements authentication_repository.FirebaseAuthenticationRepository {}

class MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

// ignore: avoid_implementing_value_types
class FakeAppEvent extends Fake implements AppEvent {}

// ignore: avoid_implementing_value_types
class FakeAppState extends Fake implements AppState {}

void main() {
  authentication_repository.FirebaseAuthenticationRepository
      firebaseAuthenticationRepository = MockAuthenticationRepository();
  MockUser user = MockUser();
  setUp(() {
    firebaseAuthenticationRepository = MockAuthenticationRepository();
    user = MockUser();

    /// Looks like a bug in the supposed nullsafety mockito package.
    /// () => matches the type but raises a separate error.. bad docs.
    when(
      () => firebaseAuthenticationRepository.user,
    ).thenAnswer(
      (_) {
        const Stream<authentication_repository.User> stream =
            Stream<authentication_repository.User>.empty();

        /// Sample code wrong?
        return Stream.fromIterable(
          [
            authentication_repository.User.empty,
          ],
        );
      },
    );
    // Mockito vs mocktail syntax
    // when(firebaseAuthenticationRepository.user).thenAnswer(
    //     (_) => const Stream<authentication_repository.User>.empty());

    when(
      () => firebaseAuthenticationRepository.currentUser,
    ).thenReturn(
      user,
    );
    when(() => user.isNotEmpty).thenReturn(true);
    when(() => user.isEmpty).thenReturn(false);
    when(() => user.firstName).thenReturn('firstName');
    when(() => user.lastName).thenReturn('McLastName');
    when(() => user.emailAddress).thenReturn('test@gmail.com');

    print(user.emailAddress);
  });

  testWidgets('App renders', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    /// Check whether we simply mock this or use the non-firebase local mock
    /// implementation to provide uid and things or use firebase local
    /// emulator

    await firebaseAuthenticationRepository.user.first;

    await tester.pumpWidget(
      WebstoreApp(
        authenticationRepository: firebaseAuthenticationRepository,
      ),
    );

    // Find a menu on home app screen.
    expect(find.byType(AppView), findsOneWidget);

    await tester.pump();
  });

  // group('AppView', () {
  //   late authentication_repository.FirebaseAuthenticationRepository
  //       firebaseAuthenticationRepository;
  //   late AppBloc appBloc;

  //   setUpAll(() {
  //     registerFallbackValue<AppEvent>(FakeAppEvent());
  //     registerFallbackValue<AppState>(FakeAppState());
  //   });
  //   setUp(() {
  //     firebaseAuthenticationRepository = MockAuthenticationRepository();
  //     appBloc = MockAppBloc();
  //   });
  //   testWidgets('navigates to HomeScreen when authenticated', (tester) async {
  //     final user = MockUser();
  //     when(() => user.emailAddress).thenReturn('test@gmail.com');
  //     when(() => appBloc.state).thenReturn(AppState.authenticated(user));
  //     await tester.pumpWidget(
  //       RepositoryProvider.value(
  //         value: firebaseAuthenticationRepository,
  //         child: MaterialApp(
  //           home: BlocProvider.value(value: appBloc, child: const AppView()),
  //         ),
  //       ),
  //     );
  //     await tester.pumpAndSettle();
  //     debugDumpApp();

  //     expect(find.byType(HomeScreen), findsOneWidget);
  //   });
  // });
}
