import 'package:flutter/material.dart';
import 'package:flutterudemycourse/formValidation/screens/login_screen.dart';

class formValidation extends StatelessWidget {
  const formValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log me in',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
