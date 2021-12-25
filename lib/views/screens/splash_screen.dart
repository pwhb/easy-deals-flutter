import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_deals/views/screens/login_screen.dart';
import 'package:easy_deals/views/screens/registration_screen.dart';
import 'package:easy_deals/views/components/auth_button.dart';
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
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/trolley.png',
                  width: 160.0,
                ),
              ),
            ),
            Hero(
              tag: 'title-text',
              child: DefaultTextStyle(
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Hero>[
                Hero(
                  tag: 'button1',
                  child: AuthButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    title: 'Login',
                  ),
                ),
                Hero(
                  tag: 'button2',
                  child: AuthButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                    title: 'Join Now',
                    reverse: true,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
