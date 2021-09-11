import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[emailField(), passwordField(), submitButton()],
            )));
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@gmail.com',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordField() {
    return TextFormField(keyboardType: TextInputType.number);
  }

  Widget submitButton() {
    return ElevatedButton(onPressed: () {}, child: Container());
  }
}
