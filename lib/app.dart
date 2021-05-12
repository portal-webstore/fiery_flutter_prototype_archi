import 'package:authentication_repository/authentication_repository.dart';
import 'package:fiery_flutter_prototype_archi/home/screens/home_screen.dart';
import 'package:fiery_flutter_prototype_archi/shared/routes/route_generator.dart';
import 'package:flutter/material.dart';

class WebstoreApp extends StatelessWidget {
  const WebstoreApp({
    Key? key,
    required FirebaseAuthenticationRepository authenticationRepository,
  })   : _authenticationRepository = authenticationRepository,
        super(key: key);

  final FirebaseAuthenticationRepository _authenticationRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // initializeDateFormatting(en_AU);

    return MaterialApp(
      title: 'Webstore portal home',
      // - TODO: Use our own custom localisation delegate
      // localizationsDelegates: const [
      //   // AustralianLocalisationDelegate(),
      //   // GlobalMaterialLocalizations.delegate,
      //   // GlobalWidgetsLocalizations.delegate,
      // ],
      supportedLocales: const [
        Locale('en', 'AU'), // English (Australia)
        Locale('en', 'US'), // English (United States) for safe defaults
      ],
      // - TODO: Use our own custom theme package
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: const HomeScreen(
        title: 'Webstore portal home',
      ),
      onGenerateRoute: RouteGenerator.getRouteOnGenerate,
    );
  }
}
