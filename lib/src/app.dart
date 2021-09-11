import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterudemycourse/src/image_model.dart';
import 'package:flutterudemycourse/src/widgets/image_list.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:http/http.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++; // this increments the variable by 1 everytime we make a request
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
    final imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(
          imageModel); //every time we get a json data for image Model we save it in images and the list will keep growing
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageList(images),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: fetchImage,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text('Flutter Udemy Course'),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
