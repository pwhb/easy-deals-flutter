import 'package:easy_deals/services/auth_controllers.dart';
import 'package:easy_deals/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   AlertDialog(
      title: const Text('Are you sure?'),
      content:
      const Text('You\'re about to logout your account.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            signOut();
            Navigator.pushReplacementNamed(
                context, SplashScreen.id);
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}