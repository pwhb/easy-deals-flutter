import 'package:flutter/material.dart';

class EditProfilePicture extends StatelessWidget {
  const EditProfilePicture({Key? key, required this.uid, this.photoUrl, required this.onUrlChange, this.isLoading = false}) : super(key: key);
  final String? photoUrl;
  final String uid;
  final String onUrlChange;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
