import 'package:easy_deals/services/auth_store.dart';
import 'package:easy_deals/views/screens/home_screen.dart';
import 'package:easy_deals/views/screens/login_screen.dart';
import 'package:easy_deals/views/screens/registration_screen.dart';
import 'package:easy_deals/views/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final bool notLoggedIn = FirebaseAuth.instance.currentUser == null &&
      GoogleSignIn().currentUser == null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.,

          backgroundColor: Colors.yellow,
          primarySwatch: Colors.teal,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('my', ''),
        ],
        initialRoute: notLoggedIn ? SplashScreen.id : HomeScreen.id,
        routes: {
          SplashScreen.id: (BuildContext context) => const SplashScreen(),
          LoginScreen.id: (BuildContext context) => const LoginScreen(),
          RegistrationScreen.id: (BuildContext context) =>
              const RegistrationScreen(),
          HomeScreen.id: (BuildContext context) => const HomeScreen(),
        },
      ),
    );
  }
}
