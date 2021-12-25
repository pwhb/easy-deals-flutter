import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Future updateFirestore(String uid, String email) async {
//
// }

Future<dynamic> signInUsingGoogle() async {
  try {
    await _googleSignIn.signIn();
    if (_googleSignIn.currentUser != null) {
      // await updateFirestore(, _googleSignIn.currentUser!.email);
      String uid = _googleSignIn.currentUser!.id;
      String email = _googleSignIn.currentUser!.email;
      await _firestore
          .collection('users')
          .doc(uid)
          .update({'username': uid, 'email': email});
      return _googleSignIn.currentUser;
    }
    return null;
  } catch (e) {
    developer.log('signInUsingGoogle', error: e);
  }
}

Future<dynamic> normalSignIn(
  String email,
  String password,
) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return _auth.currentUser;
  } on FirebaseAuthException catch (e) {
    developer.log('normalSignIn', error: e);
    if (e.code == 'unknown') {
      return 'The form cannot be empty.';
    }
    return e.message;
  }
}

Future<dynamic> normalSignUp(
  String email,
  String password,
) async {
  try {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (_auth.currentUser != null) {
      String uid = _googleSignIn.currentUser!.id;
      String email = _googleSignIn.currentUser!.email;
      await _firestore
          .collection('users')
          .doc(uid)
          .update({'username': uid, 'email': email});
      // await updateFirestore(_auth.currentUser!.uid, _auth.currentUser!.email!);
      return _auth.currentUser;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'unknown') {
      return 'The form cannot be empty.';
    }
    developer.log('normalSignUp', error: e);
    return e.message;
  }
}

void normalSignOut() async {
  await _auth.signOut();
  await _googleSignIn.signOut();
}
