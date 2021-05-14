import 'package:authentication_repository/authentication_repository.dart';
import 'package:colour_style_guide/colour_style_guide.dart';
import 'package:fiery_flutter_prototype_archi/home/screens/home_screen.dart';
import 'package:fiery_flutter_prototype_archi/shared/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
import 'package:i18n_l10n_australian/i18n_l10n_australian.dart'
    show AustralianAppLocalisationDelegate;

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
    //? add call in highest initState/widget?
    // initializeDateFormatting(en_AU);
    // Or rely in date locales already plugged in, delegates.

    return MaterialApp(
      title: 'Webstore portal home',
      localizationsDelegates: const [
        AustralianAppLocalisationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'AU'), // English (Australia)
        Locale('en', 'US'), // English (United States) for safe defaults
      ],
      // - TODO: Use our own custom theme package
      theme: ColouredTheme.data,
      home: const HomeScreen(
        title: 'Webstore portal home',
      ),
      onGenerateRoute: RouteGenerator.getRouteOnGenerate,
    );
  }
}
