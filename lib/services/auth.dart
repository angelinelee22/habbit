import 'package:firebase_auth/firebase_auth.dart';
import 'package:habbit/model/firebase_user.dart';
import 'package:habbit/services/database.dart';

class AuthService {
  // underscore means private var only in this file
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on User
  // take out everything except the elements we need like uid
  FirebaseUser? _firebaseUserFromUser(User user) {
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }

  // auth change user stream (based on logged in or not)
  Stream<FirebaseUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _firebaseUserFromUser(user!));
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _firebaseUserFromUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid).updateUserLogin(false);

      return _firebaseUserFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password,
      String first_name, String last_name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData(first_name, last_name, [], 0, true);

      return _firebaseUserFromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
