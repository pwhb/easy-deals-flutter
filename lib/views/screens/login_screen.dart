import 'package:easy_deals/services/auth_controllers.dart';
import 'package:easy_deals/views/screens/home_screen.dart';
import 'package:easy_deals/views/screens/registration_screen.dart';
import 'package:easy_deals/views/widgets/AuthButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hidePassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool? _success;
  String _userEmail = '';
  String? _error = '';

  bool _normalLoading = false;
  bool _googleLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/trolley.png',
                  width: 40.0,
                ),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      contentPadding: const EdgeInsets.all(10.0),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                        icon: Icon(_hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            Text(
              _success == null
                  ? ''
                  : (_success!
                      ? 'Successfully registered $_userEmail'
                      : _error!),
              style: TextStyle(color: _error == null ? null : Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            AuthButton(
              onPressed: () async {
                setState(() {
                  _normalLoading = true;
                });
                dynamic response = await normalSignIn(
                    _emailController.text, _passwordController.text);

                setState(() {
                  _normalLoading = false;
                  if (response is User) {
                    _success = true;
                    _error = null;
                    _userEmail = response.email!;
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.id, (route) => false);
                  } else {
                    _success = false;
                    _error = response;
                  }
                });
              },
              title: 'Sign In',
              isLoading: _normalLoading,
            ),
            AuthButton(
              onPressed: () async {
                setState(() {
                  _googleLoading = true;
                });
                dynamic response = await signInUsingGoogle();
                setState(() {
                  _googleLoading = false;
                  if (response == null) {
                    _success = false;
                    _error = 'Google Login Failed.';
                  } else {
                    _success = true;
                    _error = null;
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.id, (route) => false);
                  }
                });
              },
              title: 'Google Sign In',
              reverse: true,
              isLoading: _googleLoading,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              child: Text(
                'Don\'t have an account? Sign up.',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
