import 'package:flutter/material.dart';

class phDetails extends StatelessWidget {
  String title;
  String subtitle;
  String description;
  String penyebab;
  String solusi;
  String gejala;
  ImageProvider image;

  phDetails({
    @required String title,
    String subtitle,
    @required description,
    @required ImageProvider image,
    @required String solusi,
    @required String gejala,
    @required String penyebab,
  }) {

    this.title = title;
    this.gejala = gejala;
    this.subtitle = subtitle;
    this.description = description;
    this.penyebab = penyebab;
    this.solusi = solusi;
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
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 280,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: this.image, fit: BoxFit.fill)),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
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
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gejala',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.gejala,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Penyebab',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.penyebab,
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.description,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Solusi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5,bottom: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      this.solusi,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
