abstract class AuthenticationRepository {
  Future<void> authenticate();

  Future<String> getUserID();

  Future<bool> isAuthenticated();
}
