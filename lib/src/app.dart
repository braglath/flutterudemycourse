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
  String numCarry = '';
  String noOfParticipants = '0';
  final GlobalKey<FormState> gKey = GlobalKey<FormState>();

  void fetchImage(value) async {
    counter++;
    noOfParticipants =
        value; // this increments the variable by 1 everytime we make a request
    final response = await http.get(Uri.parse(
        'https://www.boredapi.com/api/activity?participants=$noOfParticipants'));
    final imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
      print(
          noOfParticipants); //every time we get a json data for image Model we save it in images and the list will keep growing
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Container(
        // height: 50.0,
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Text('Your Activity'),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 0.0),
                child: ImageList(images),
              ),
            ),
            forms()
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Flutter Udemy Course'),
        backgroundColor: Colors.amber,
      ),
    );
  }

  Widget forms() {
    return Container(
      child: Form(
        key: gKey,
        child: Column(
          children: <Widget>[
            participantsChoice(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget participantsChoice() {
    return TextFormField(
      keyboardType: TextInputType.number,
      initialValue: '1',
      decoration: InputDecoration(
        labelText: 'No of participants',
        hintText: 'Max 8 participants',
      ),
      onSaved: (value) {
        String? numCarry = value;
        fetchImage(value);
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          if (gKey.currentState!.validate()) {
            gKey.currentState?.save();
          }
        },
        child: Text('Submit'));
  }

  Widget activityText(ImageModel images) {
    return Container(
      child: Text(images.activity),
    );
  }
}
