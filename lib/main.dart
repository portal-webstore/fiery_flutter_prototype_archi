import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart' show Bloc;
import 'package:fiery_flutter_prototype_archi/app/observers/app_bloc_observer.dart'
    show AppBlocObserver;
import 'package:fiery_flutter_prototype_archi/app/views/webstore_app.dart'
    show WebstoreApp;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:i18n_l10n_australian/i18n_l10n_australian.dart'
    show AustralianDateLocale;
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;

// ignore: avoid_void_async
void main() async {
  await initializeDateFormatting(AustralianDateLocale.en_AU);
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
