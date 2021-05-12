import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart' show Bloc;
import 'package:fiery_flutter_prototype_archi/app.dart' show WebstoreApp;
import 'package:fiery_flutter_prototype_archi/app/observers/app_bloc_observer.dart'
    show AppBlocObserver;
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// Coupled anyway with the web import and the iOS Android setup
  ///
  final FirebaseAuthenticationRepository authenticationRepository =
      FirebaseAuthenticationRepository();
  await authenticationRepository.user.first;

  runApp(
    WebstoreApp(
      authenticationRepository: authenticationRepository,
    ),
  );
}
