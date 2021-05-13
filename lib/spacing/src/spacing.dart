/// {@template spacing}
/// Provide common spacing increments
///
/// Potentially used for non-spacing related numerical UI proportions
///
///
/// Non-instantiable
/// {@endtemplate}
class Spacing {
  /// {@macro spacing}
  const Spacing._();

  /// 4.0 8.0 16.0
  static const double sizeSmall = 4.0;
  static const double sizeMedium = sizeSmall * 2;
  static const double sizeLarge = sizeSmall * 3;
}
