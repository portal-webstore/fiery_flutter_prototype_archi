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

  /// Expoes two named constructors to make it "easier to work with"
  /// is this laziness?
  ///
  /// The other example in the **same documentation** follows the convention of
  /// distinct state classes:
  /// - Uninitialised()
  /// - Authenticated()
  /// - Unauthenticated()
  const AppState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
