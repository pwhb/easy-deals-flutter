import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_deals/models/user.dart';
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
      // await _firestore
      //     .collection('users')
      //     .doc(_googleSignIn.currentUser!.id)
      //     .update({
      //   'username': _googleSignIn.currentUser!.id,
      //   'email': _googleSignIn.currentUser!.email,
      // });
      return _googleSignIn.currentUser;
    }
    return null;
  } on FirebaseException catch (e) {
    // if (e.code == 'not-found') {
    //   await _firestore
    //       .collection('users')
    //       .doc(_googleSignIn.currentUser!.id)
    //       .set({
    //     'username': _googleSignIn.currentUser!.id,
    //     'email': _googleSignIn.currentUser!.email
    //   });
    //   return _googleSignIn.currentUser;
    // }
    developer.log('signInUsingGoogle', error: e);
    return null;
  }
}

Future<dynamic> signUpUsingGoogle() async {
  try {
    await _googleSignIn.signIn();
    if (_googleSignIn.currentUser != null) {
      // await _firestore
      //     .collection('users')
      //     .doc(_googleSignIn.currentUser!.id)
      //     .update({
      //   'username': _googleSignIn.currentUser!.id,
      //   'email': _googleSignIn.currentUser!.email,
      // });
      return _googleSignIn.currentUser;
    }
    return null;
  } on FirebaseException catch (e) {
    // if (e.code == 'not-found') {
    //   await _firestore
    //       .collection('users')
    //       .doc(_googleSignIn.currentUser!.id)
    //       .set({
    //     'username': _googleSignIn.currentUser!.id,
    //     'email': _googleSignIn.currentUser!.email
    //   });
    //   return _googleSignIn.currentUser;
    // }
    developer.log('signInUsingGoogle', error: e);
    return null;
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
  String name,
  String email,
  String password,
) async {
  if (name.length < 3) {
    return 'Name is too short.';
  }
  try {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (_auth.currentUser != null) {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({'name': name, 'email': email});
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

Future<UserModel?> getUser(String uid) async {
  try {
    final DocumentSnapshot doc =
        await _firestore.collection('users').doc(uid).get();
    dynamic docData = doc.data();
    UserModel user = UserModel(
        email: docData['email'],
        name: docData['name'],
        itemsToSell: docData['itemsToSell'],
        itemsInCart: docData['itemsInCart'],
        watchList: docData['watchList'],
        photoUrl: docData['photoUrl']);
    return user;
  } catch (e) {
    developer.log('getUser', error: e);
  }
}

void signOut() async {
  await _auth.signOut();
  await _googleSignIn.signOut();
}
