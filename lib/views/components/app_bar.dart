import 'package:easy_deals/views/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';

enum HomeMenuChoices {
  about,
  setting,
  logout
}

class HomeAppBar extends StatelessWidget implements PreferredSize {
  const HomeAppBar({Key? key, this.title = 'Easy Deals'}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(title),
      actions: [
        PopupMenuButton(
            onSelected: (value) {
              if (value == HomeMenuChoices.logout) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                  const LogoutAlertDialog(),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: Text('About'),
                value: HomeMenuChoices.about,
              ),
              const PopupMenuItem(
                child: Text('Setting'),
                value: HomeMenuChoices.setting,
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                  child: Text('Log out'),
                  value: HomeMenuChoices.logout),
            ])
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
