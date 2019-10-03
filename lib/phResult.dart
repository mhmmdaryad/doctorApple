import 'dart:io';

import 'package:flutter/material.dart';

class phResult extends StatelessWidget {
  String imagePath;

  phResult({@required String imagePath}) {
    this.imagePath = imagePath;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Konfirmasi gambar"),
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
              alignment: Alignment.center,
              height: 500,
              child: Image.file(File(this.imagePath)),
            ),
Container(
  child: InkWell(

  ),
),
          ],
        ),
      ),
    );
  }
}
