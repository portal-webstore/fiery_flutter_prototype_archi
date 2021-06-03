import 'package:colour_style_guide/colour_style_guide.dart' show ColouredTheme;
import 'package:fiery_flutter_prototype_archi/dashboard/screens/dashboard_screen.dart'
    show DashboardScreen;
import 'package:fiery_flutter_prototype_archi/shared/routes/route_generator.dart'
    show RouteGenerator;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
import 'package:i18n_l10n_australian/i18n_l10n_australian.dart'
    show AustralianAppLocalisationDelegate;

/// Strange that the app *view* is the MaterialApp builder.
class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //? add call in highest initState/widget?
    // initializeDateFormatting(en_AU);
    // Or rely in date locales already plugged in, delegates.

    return MaterialApp(
      localizationsDelegates: const [
        AustralianAppLocalisationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'AU'), // English (Australia)
        Locale('en', 'US'), // English (United States) for safe defaults
      ],
      theme: ColouredTheme.data,
      home: const DashboardScreen(),
      onGenerateRoute: RouteGenerator.getRouteOnGenerate,
    );
  }
}
