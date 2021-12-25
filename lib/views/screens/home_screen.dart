import 'package:easy_deals/services/auth_controllers.dart';
import 'package:easy_deals/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Deals'),
        actions: [
          // DropdownButton(items: [], onChanged: () {})
        ],
      ),
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          const Text('Home', textAlign: TextAlign.center,),
          TextButton(onPressed: () {
            normalSignOut();
            Navigator.pushNamedAndRemoveUntil(context, SplashScreen.id, (route) => false);
          }, child: const Text('logout'),)
        ],
      ),
    ));
  }
}
