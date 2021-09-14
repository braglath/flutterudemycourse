import 'package:flutter/material.dart';
import 'package:flutterudemycourse/formValidation/app.dart';
import 'package:flutterudemycourse/src/app.dart';

void main() {
  // runApp(const MyApp());
  runApp(formValidation());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter udemy course',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: App(),
    );
  }
}
