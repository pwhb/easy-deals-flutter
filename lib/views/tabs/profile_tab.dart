import 'package:easy_deals/models/user.dart';
import 'package:easy_deals/services/auth_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _isLoading = true;
  UserModel? _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? _docId;

  void initFunction() async {
    if (_googleSignIn.currentUser != null) {
      // print('google user');
      // _docId = _googleSignIn.currentUser!.id;
      //
      // _currentUser = UserModel(
      //   name: _googleUser!.displayName,
      //   email: _googleUser!.email,
      // );
    }
    if (_firebaseAuth.currentUser != null) {
      _docId = _firebaseAuth.currentUser!.uid;
      _currentUser = await getUser(_docId!);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    initFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Text('Loading...')
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('name: ${_currentUser!.name}'),
              Text('email: ${_currentUser!.email}'),
              Text('photoUrl: ${_currentUser?.photoUrl}'),
              Text('itemsInCart: ${_currentUser?.itemsInCart}'),
              Text('itemsToSell: ${_currentUser?.itemsToSell}'),
              Text('watchList: ${_currentUser?.watchList}'),
            ],
          );
  }
}
