import 'package:authentication_repository/authentication_repository.dart';
import 'package:authentication_repository/src/authentication_repository.dart'
    show AuthenticationRepository;
import 'package:authentication_repository/src/exceptions/exceptions.dart'
    show
        LogInWithEmailOtpLinkFailure,
        LogInWithEmailAndPasswordFailure,
        SignUpFailure;
import 'package:authentication_repository/src/extensions/firebase_auth_to_user.dart'
    show UserConverter;
import 'package:authentication_repository/src/models/models.dart' as auth_repo
    show User;
import 'package:cache_client/cache_client.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth
    show FirebaseAuth, FirebaseAuthException, User, UserCredential;

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  FirebaseAuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    CacheClient? cacheClient,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _cacheClient = cacheClient ?? CacheClient();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final CacheClient _cacheClient;

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((
      firebase_auth.User? firebaseUser,
    ) {
      final auth_repo.User blankedUser =
          firebaseUser == null ? auth_repo.User.empty : firebaseUser.toUser;

      _cacheClient.write(
        key: AuthenticationRepositoryKeys.loginUserCache,
        value: blankedUser,
      );

      return blankedUser;
    });
  }

  /// Anonymous sign in...
  @override
  Future<firebase_auth.UserCredential> authenticate() async {
    return _firebaseAuth.signInAnonymously();
  }

  Future<firebase_auth.UserCredential> magicEmailOtpSignIn(
    String email,
    String emailLink,
  ) async {
    try {
      final firebase_auth.UserCredential signedIn =
          await _firebaseAuth.signInWithEmailLink(
        email: email,
        emailLink: emailLink,
      );

      return signedIn;
    } on firebase_auth.FirebaseAuthException catch (signInException) {
      print(signInException);

      // Invalid link, expired etc
      throw LogInWithEmailOtpLinkFailure();
    } on Exception catch (unexpectedFailure) {
      print(
        'Unexpected email OTP sign-in failure ${unexpectedFailure.toString()}',
      );
    }

    throw LogInWithEmailOtpLinkFailure();
  }

  @override
  Future<String?> getUserID() async {
    return (_firebaseAuth.currentUser)?.uid;
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _cacheClient.read<User>(
          key: AuthenticationRepositoryKeys.loginUserCache,
        ) ??
        User.empty;
  }

  @override
  Future<bool> isAuthenticated() async {
    final firebase_auth.User? currentUser = await _firebaseAuth.currentUser;

    return currentUser != null;
  }

  Future<firebase_auth.UserCredential> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final firebase_auth.UserCredential createdUserCredentials =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebase_auth.User? userToAddProfileInfo =
          createdUserCredentials.user;

      await userToAddProfileInfo?.updateProfile(
        displayName: displayName,
      );

      return createdUserCredentials;
    } on firebase_auth.FirebaseAuthException catch (knownSignUpException) {
      /// [FirebaseAuthException] maybe thrown with the following error codes:
      /// email-already-in-use:
      /// Thrown if there already exists an account with the given email address.
      /// invalid-email:
      /// Thrown if the email address is not valid.
      /// operation-not-allowed:
      /// Thrown if email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.
      /// weak-password:
      /// Thrown if the password is not strong enough.
      /// no-app:
      /// if firebase app does not exist / not configured.
      ///
      final String errorCode = knownSignUpException.code;
      print('Sign up error $errorCode');

      /// Feels code smelly as these "exceptions" are valid login runtime states
      /// email-already-in-use does not sound like an **exception**
      /// the others ones, possibly. i.e. invalid input somehow bypassed
      ///
      /// Generalisation
      throw SignUpFailure();
    } on Exception catch (unexpectedSignupException) {
      print('Strange sign up error ${unexpectedSignupException.toString()}');

      throw SignUpFailure();
    }

    /// This should never occur
    // return null;
  }

  Future<firebase_auth.UserCredential> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final firebase_auth.UserCredential signedInUser =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return signedInUser;
    } on firebase_auth.FirebaseAuthException catch (loginException) {
      print(loginException);

      /// Important: You must enable Email & Password accounts in the Auth section of the Firebase console before being able to use them.
      ///
      /// A [FirebaseAuthException] maybe thrown with the following error code:
      ///
      /// invalid-email:
      /// Thrown if the email address is not valid.
      /// user-disabled:
      /// Thrown if the user corresponding to the given email has been disabled.
      /// user-not-found:
      /// Thrown if there is no user corresponding to the given email.
      /// wrong-password:
      /// Thrown if the password is invalid for the given email, or the account corresponding to the email does not have a password set.
      ///
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),

        /// Multiple awaits if we colocalised multiple providers in one.
      ]);
    } on firebase_auth.FirebaseAuthException {
      throw LogOutFailure();
    } on Exception {
      throw LogOutFailure();
    }
  }
}
