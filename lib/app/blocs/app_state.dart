part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  /// - TODO: Refactor this back out after getting working login states
  /// Refactor back out into separate sealed states classes for cleaner expand
  ///
  /// Exposes two named constructors to make it "easier to work with"
  /// is this laziness?
  ///
  /// The other example in the **same documentation** follows the convention of
  /// distinct state classes:
  /// - Uninitialised()
  /// - Authenticated()
  /// - Unauthenticated()
  const AppState.authenticated(User user)
      : this._(
          status: AppStatus.authenticated,
          user: user,
        );

  const AppState.unauthenticated()
      : this._(
          status: AppStatus.unauthenticated,
        );

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}

/// It's an odd choice to pick and choose where the documented examples feel
/// like taking the quick way out compared to supposed scalable architecture way
///
///
/// Should we not prefer the sealed classes `is` pattern matching paradigm
/// for BLoC?
///
/// Rather than limiting the scalability to enum...
/// As long as we do not have duplicated conditional logic.
///
/// `is` pattern matching is nice
///
/// See another example
/// https://github.com/fiery-flutter/currency-rates/commit/0e5af287375f510e1818ff864e7c27778a95fe45/lib/src/feature/rates/view/bloc/currency_rate_state.dart
///
/// https://stackoverflow.com/questions/54317000/are-there-any-sealed-classes-alternatives-in-dart-2-0
///
/// https://github.com/dart-lang/language/issues/349#issuecomment-388912316
///
/// A relatively well-structured real-ish world example scaffolded out
/// https://github.com/TortikiDev/mobile-app/tree/70f6427105f741775b5ff641840e3f05048a84ab/lib/bloc
///
