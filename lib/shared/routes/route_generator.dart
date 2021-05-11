import 'package:fiery_flutter_prototype_archi/home/screens/home_screen.dart';
import 'package:fiery_flutter_prototype_archi/shared/routes/routes.dart'
    show Routes;
import 'package:flutter/material.dart'
    show BuildContext, MaterialPageRoute, Route, RouteSettings;

/// {@template route_generator}
/// Route generator for dynamic substitution into App instantiation.
/// {@endtemplate}
class RouteGenerator {
  /// Static class namespacing
  const RouteGenerator._();

  static Route getRouteOnGenerate(RouteSettings settings) {
    // ignore: unused_local_variable
    final Object? args = settings.arguments;

    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const HomeScreen();
        });

      default:
        return MaterialPageRoute<void>(builder: (BuildContext context) {
          return const HomeScreen();
        });
    }
  }
}
