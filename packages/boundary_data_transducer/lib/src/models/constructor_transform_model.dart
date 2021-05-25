/// The happy path conversion that we want to try first and catch exceptions
///
/// Data boundary safety in case a naughty dev edits the backend (Firestore)
typedef ConstructorTransform<T> = T Function(dynamic dataJsonMap);
