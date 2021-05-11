import 'package:colour_style_guide/src/theme_colours.dart' show ThemeColours;
import 'package:flutter/material.dart' show ThemeData, VisualDensity;

/// Our quick custom style guide colours
class ColouredTheme {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  const ColouredTheme._();

  /// Material theme using our custom colours
  static final ThemeData data = ThemeData(
    primarySwatch: ThemeColours.blue,
    accentColor: ThemeColours.blueAccent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
