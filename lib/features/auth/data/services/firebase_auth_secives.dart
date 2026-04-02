import 'package:firebase_auth/firebase_auth.dart';
import 'package:nti_repo/features/auth/data/models/user_data_class.dart';

class FirebaseAuthServices {
  //
  static FirebaseAuth _ourAuthObject = FirebaseAuth.instance;
  //

  static Future<UserCredential?> singUp(UserDataClass userData) async {
    try {
      UserCredential userCredential = await _ourAuthObject
          .createUserWithEmailAndPassword(
            email: userData.email,
            password: userData.name,
          );

      return userCredential;
    } on FirebaseAuthException catch (_, e) {
      return null;
    }
  }

  static Future<UserCredential?> signIn(UserDataClass userData) async {
    try {
      UserCredential userCredential = await _ourAuthObject
          .signInWithEmailAndPassword(
            email: userData.email,
            password: userData.name,
          );

      return userCredential;
    } on FirebaseAuthException catch (_, e) {
      return null;
    }
  }

  static Future<void> signOut() async {
    await _ourAuthObject.signOut();
  }
}
