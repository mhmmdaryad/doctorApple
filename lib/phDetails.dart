import 'package:flutter/material.dart';

class phDetails extends StatelessWidget {
  String title;
  String subtitle;
  String description;
  ImageProvider image;

  phDetails(
      {@required String title,
      String subtitle,
      @required description,
      @required ImageProvider image}) {
    this.title = title;
    this.subtitle = subtitle;
    this.description = description;
    this.image = image;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: this.image, fit: BoxFit.fill)),
            ),
            Text(this.title),
            Text(this.description)
          ],
        ),
      ),
    );
  }
}
