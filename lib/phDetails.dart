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
        title: Text("Detail Penyakit"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 280,
              decoration: BoxDecoration(
                  image: DecorationImage(image: this.image, fit: BoxFit.fill)),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    this.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              height: 50,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    this.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
