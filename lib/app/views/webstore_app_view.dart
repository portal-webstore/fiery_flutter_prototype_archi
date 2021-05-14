import 'package:colour_style_guide/colour_style_guide.dart';
import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart';
import 'package:fiery_flutter_prototype_archi/app/routes/routes.dart';
import 'package:fiery_flutter_prototype_archi/shared/routes/route_generator.dart';
import 'package:flow_builder/flow_builder.dart' show FlowBuilder;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show SelectContext;
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
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
      onGenerateRoute: RouteGenerator.getRouteOnGenerate,
    );
  }
}
