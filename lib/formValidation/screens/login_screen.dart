import 'package:flutter/material.dart';
import 'package:flutterudemycourse/formValidation/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with validationMixin {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final textFieldFocusNode = FocusNode();
  bool showpass = false;
  String email = '';
  String password = '';

  void _toggleObscured() {
    setState(() {
      showpass = !showpass;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                emailField(),
                passwordField(),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                submitButton()
              ],
            )));
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@gmail.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) {
        email = value!;
        // print(email);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: showpass,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
        suffixIcon: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: GestureDetector(
              onTap: _toggleObscured,
              child: Icon(
                showpass ? Icons.visibility : Icons.visibility_off,
                size: 24.0,
              ),
            )),
      ),
      validator: validatePassword,
      onSaved: (value) {
        password = value!;
        // print(password);
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState?.save();

            print('post the $email and $password to my API');
          }
          ;
        },
        child: Container(
          child: Text(
            "Submit",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ));
  }
}
