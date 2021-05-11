import 'package:authentication_repository/src/authentication_repository.dart'
    show AuthenticationRepository;
import 'package:authentication_repository/src/exceptions/exceptions.dart'
    show LogInWithEmailOtpLinkFailure, SignUpFailure;
import 'package:firebase_auth/firebase_auth.dart' as ffAuth
    show FirebaseAuth, FirebaseAuthException, User, UserCredential;

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  const FirebaseAuthenticationRepository({
    required ffAuth.FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final ffAuth.FirebaseAuth _firebaseAuth;

  /// Anonymous sign in...
  @override
  Future<ffAuth.UserCredential> authenticate() async {
    return _firebaseAuth.signInAnonymously();
  }

  Future<ffAuth.UserCredential> magicEmailOtpSignIn(
    String email,
    String emailLink,
  ) async {
    try {
      ffAuth.UserCredential signedIn = await _firebaseAuth.signInWithEmailLink(
        email: email,
        emailLink: emailLink,
      );
    } on ffAuth.FirebaseAuthException catch (signInException) {
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

  @override
  Future<bool> isAuthenticated() async {
    final ffAuth.User? currentUser = await _firebaseAuth.currentUser;

    return currentUser != null;
  }

  Future<ffAuth.UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      ffAuth.UserCredential createdUserCredentials =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return createdUserCredentials;
    } on ffAuth.FirebaseAuthException catch (knownSignUpException) {
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
}
