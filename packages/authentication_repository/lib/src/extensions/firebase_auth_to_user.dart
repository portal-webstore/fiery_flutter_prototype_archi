import 'package:authentication_repository/src/models/models.dart'
    as auth_repo_models show User;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth show User;

extension on firebase_auth.User {
  auth_repo_models.User get toUser {
    final String? names = displayName;

    /// Placeholder. Unconventional split.
    /// Last and first split was due to a potential nurse initials use case
    ///
    /// Alternative: build up initials from each word found or take direct input
    final List<String>? splitNames = displayName?.split(' ');
    final blankedEmail = email ?? '';

    if (splitNames == null) {
      // Smelly code
      return auth_repo_models.User(
        userID: uid,
        lastName: '',
        firstName: '',
        emailAddress: blankedEmail,
      );
    }

    if (splitNames.length < 2) {
      return auth_repo_models.User(
        userID: uid,
        lastName: '',
        firstName: splitNames[0],
        emailAddress: blankedEmail,
      );
    }

    final String firstName = splitNames.sublist(0, splitNames.length).join();
    final String lastName = splitNames.last;

    return auth_repo_models.User(
      userID: uid,
      lastName: lastName,
      firstName: firstName,
      emailAddress: blankedEmail,
    );
  }
}
