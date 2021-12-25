import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.onPressed,
    this.reverse = false,
    this.isLoading = false,
    required this.title,
  }) : super(key: key);

  final Function onPressed;
  final bool reverse;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor:
            reverse ? MaterialStateProperty.all<Color>(Colors.white) : null,
      ),
      child: isLoading? const CircularProgressIndicator(color: Colors.white,) : Text(
        title,
        style: reverse
            ? TextStyle(color: Theme.of(context).colorScheme.primary)
            : null,
      ),
    );
  }
}
