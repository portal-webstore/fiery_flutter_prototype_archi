import 'package:authentication_repository/src/models/models.dart'
    as auth_repo_models show User;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth show User;

extension UserConverter on firebase_auth.User {
  auth_repo_models.User get toUser {
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

    final String firstName =
        getAllGivenNamesOutOfNameTokensAsOneConcatenatedFirstName(splitNames);
    final String lastName = splitNames.last;

    return auth_repo_models.User(
      userID: uid,
      lastName: lastName,
      firstName: firstName,
      emailAddress: blankedEmail,
    );
  }
}

/// Get everything except the last name
///
/// Into a single string
/// Workaround
///
/// Length limits should be checked prior to calling this function
String getAllGivenNamesOutOfNameTokensAsOneConcatenatedFirstName(
  List<String> splitNames,
) {
  return getAllGivenNamesTokensExceptLastLastName(splitNames).join();
}

/// Get everything except the last name in a list
///
List<String> getAllGivenNamesTokensExceptLastLastName(
  List<String> splitNames,
) {
  return splitNames.sublist(
    0,
    splitNames.length - 1,
  );
}
