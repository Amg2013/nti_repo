import 'package:firebase_auth/firebase_auth.dart';

class AuthServicesClass {
  static final _firebaseAuth = FirebaseAuth.instance;

  /// Login using email and password
  static Future<UserCredential?> loginUseingEmailAndPassword({
    required String email,
    required String password,
  })
  ///
  async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Login failed: ${e.message}');
    }
    return null;
  }

  // Rigid Register using email and password

  static Future<UserCredential?> sigUpUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Sign up failed: ${e.message}');
    }
    return null;
  }

  static Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  // static Future<UserCredential?> singinWithGoogle() async {
  //   await _firebaseAuth.signInWithProvider(GoogleAuthProvider());
  //   return null;
  // }
}
