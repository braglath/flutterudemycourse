import 'package:flutter/material.dart';
import 'package:flutterudemycourse/src/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return buildImage(images[index]);
        });
  }
  // using the main build method above we are just calling the buildImage method
  // and we are also passing the images index to the buildImage

  Widget buildImage(ImageModel images) {
    // instead of context we are getting the images from main build method which also containes the index
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        // color: Colors.amberAccent,
        child: Column(
          children: <Widget>[
            Padding(
                child: Image.network(images.url),
                padding: EdgeInsets.only(bottom: 10.0)),
            Text(
              images.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 17.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
