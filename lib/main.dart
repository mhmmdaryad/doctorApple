import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static TabController _controller;

//  void initState() {
//    super.initState();
//    _controller = new TabController(vsync: this, length: 2);
//  }

  static List<Widget> _widgetOption = <Widget>[
    Container(
        child: Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 22.0),
          child: new Image.asset('assets/icon/back.png'),
          height: 800,
          width: 600,
          color: Colors.white,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 120, left: 130),
            child: new Image.asset('assets/icon/buahApel.png'),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 40,left: 20),
            child: Text(
              'DOCTOR\nAPPLE',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    )),
    Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: new Image.asset('assets/icon/header2.png'),
              ),
            ),
            height: 150,
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.only(top: 130),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari Gejala',
                      contentPadding: EdgeInsets.only(
                        left: 20,
                        top: 15,
                        bottom: 15,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(color: Colors.black),
                  child: new TabBar(
                    controller: _controller,
                    tabs: [
                      new Tab(
                        text: 'Penyakit',
                      ),
                      new Tab(
                        text: 'Hama',
                      ),
                    ],
                  ),
                ),
                new Container(
                  height: 80.0,
                  child: new TabBarView(
                    controller: _controller,
                    children: <Widget>[
                      new Card(
                        child: new ListTile(
                          leading: const Icon(Icons.home),
                          title: new TextField(
                            decoration: const InputDecoration(
                                hintText: 'Search for address...'),
                          ),
                        ),
                      ),
                      new Card(
                        child: new ListTile(
                          leading: const Icon(Icons.location_on),
                          title: new Text(
                              'Latitude: 48.09342\nLongitude: 11.23403'),
                          trailing: new IconButton(
                              icon: const Icon(Icons.my_location),
                              onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 20, top: 20.0),
                        child: Text(
                          'Tentang\nApel',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 0),
                        child: Text('tes'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            title: Text('Penyakit & Solusi'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info), title: Text('Tentang Apel'))
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 17, 142, 74),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Add your onPressed code here!
          cameras = await availableCameras();
          runApp(CameraApp());
        },
        child: Icon(Icons.camera_alt),
        backgroundColor: Colors.green,
      ),
      body: Container(
        alignment: Alignment(0, 0),
        child: _widgetOption.elementAt(_selectedIndex),
      ),
    );
  }
}

List<CameraDescription> cameras;

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (!controller.value.isInitialized) {
      return Container();
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
