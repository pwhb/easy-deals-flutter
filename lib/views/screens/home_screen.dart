import 'package:easy_deals/views/components/app_bar.dart';
import 'package:easy_deals/views/dialogs/exit_dialog.dart';
import 'package:easy_deals/views/tabs/home_tab.dart';
import 'package:easy_deals/views/tabs/notification_tab.dart';
import 'package:easy_deals/views/tabs/profile_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  static final List<Widget> _tabOptions = <Widget>[
    const ProfileTab(),
    const HomeTab(),
    const NotificationTab(),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context, builder: (context) => const ExitAlertDialog()) ??
        false);
  }



  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: Center(
          child: _tabOptions[_selectedTab],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
          currentIndex: _selectedTab,
          showUnselectedLabels: false,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
        ),
      ),
    );
  }
}
