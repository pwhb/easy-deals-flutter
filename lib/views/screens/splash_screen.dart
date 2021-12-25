import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_deals/views/screens/login_screen.dart';
import 'package:easy_deals/views/screens/registration_screen.dart';
import 'package:easy_deals/views/widgets/AuthButton.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                'images/trolley.png',
                width: 160.0,
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: <AnimatedText>[
                  TypewriterAnimatedText(
                    'Easy Deals',
                    textAlign: TextAlign.center,
                  ),
                  TypewriterAnimatedText(
                    'one man\'s trash is another man\'s treasure',
                    textAlign: TextAlign.center,
                  ),
                  TypewriterAnimatedText(
                    'the easy way to make a deal',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <AuthButton>[
                AuthButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  title: 'Login',
                ),
                AuthButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  title: 'Join Now',
                  reverse: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
