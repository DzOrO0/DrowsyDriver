import 'package:drowsy_driver/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Auth change user stream
  Stream<UserModel?> get onAuthStateChanged {
    return _auth.authStateChanges().map(_userModelFromFirebase);
  }

  // Create UserModel based on Firebase User
  UserModel? _userModelFromFirebase(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // Sign in with email & password
  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userModelFromFirebase(user);
    } catch (e) {
      print("Error in signIn: ${e.toString()}");
      return null;
    }
  }

  // Sign up with email & password
  Future<UserModel?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userModelFromFirebase(user);
    } catch (e) {
      print("Error in signUp: ${e.toString()}");
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error in signOut: ${e.toString()}");
      rethrow;
    }
  }
}
