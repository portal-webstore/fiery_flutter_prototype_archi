/// Interesting sample design
/// Assuming this is to decouple some parts but then they explicitly defined
/// **Google**Failure....
/// Why would we not simply use the provided FirebaseAuthException class then?
///
/// Maybe another legacy deprecated convention where the libraries were not
/// as usable
///

/// Thrown if during the sign up process if a failure occurs.
class SignUpFailure implements Exception {}

/// Thrown during the login process if a failure occurs.
class LogInWithEmailAndPasswordFailure implements Exception {}

/// Thrown during the magic one-time password email+link if a failure occurs.
class LogInWithEmailOtpLinkFailure implements Exception {}

/// Thrown during the sign in with google process if a failure occurs.
class LogInWithGoogleFailure implements Exception {}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}
