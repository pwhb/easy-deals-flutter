import 'package:flutter/material.dart';

enum HomeMenuChoices {
  about,
  setting,
  logout,
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.onPressed,
    this.reverse = false,
    this.isLoading = false,
    this.isGoogleButton = false,
    required this.title,
  }) : super(key: key);

  final Function onPressed;
  final bool reverse;
  final String title;
  final bool isLoading;
  final bool isGoogleButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor:
            reverse ? MaterialStateProperty.all<Color>(Colors.white) : null,
      ),
      child: isLoading
          ? CircularProgressIndicator(
              color: reverse ? null : Colors.white,
            )
          : isGoogleButton
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/search.png',
                      height: 20,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: reverse
                            ? TextStyle(
                                color: Theme.of(context).colorScheme.primary)
                            : null,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: reverse
                      ? TextStyle(color: Theme.of(context).colorScheme.primary)
                      : null,
                ),
    );
  }
}
