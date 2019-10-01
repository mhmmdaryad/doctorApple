import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera.dart';
import 'main.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static TabController _tabController;
  static FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode = FocusNode();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
  }

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

  static List<Widget> _widgetOption = <Widget>[
    _beranda(),
    _penyakitSolusi(),
    _tentangApel()
  ];

  static Widget _beranda() {
    return Container(
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
              padding: EdgeInsets.only(top: 130, left: 130),
              child: new Image.asset('assets/icon/buahApel.png'),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 20),
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
          Container(
            padding: EdgeInsets.only(top: 430),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                   // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text('Hitung Pupuk'),
                        subtitle: Text(
                            'Untuk meningkatkan Efisiensi dan menghemat biaya'),
                      ),
                      ButtonTheme.bar(
                        // make buttons use the appropriate styles for cards
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('HITUNG'),
                              onPressed: () {
                                /* ... */
                              },
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
        ],
      ),
    );
  }

  static Widget _penyakitSolusi() {
    _focusNode = FocusNode();

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icon/header2.png'),
                    fit: BoxFit.fill)),
            height: 150,
          ),
          Container(
//            color: Colors.blueAccent,
            padding: EdgeInsets.only(top: 130),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    focusNode: _focusNode,
                    onEditingComplete: () {
                      _focusNode.unfocus();
                    },
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
                Expanded(
                    child: Container(
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 25, right: 25),
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.green,
                        tabs: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Penyakit",
                              style: _tabText(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Hama",
                              style: _tabText(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              Container(
                                child: ListView(
                                  children: <Widget>[
                                    Card(
                                      child: ListTile(
                                        leading: FlutterLogo(size: 60.0),
                                        title: Text('Title'),
                                        subtitle: Text('Sub-title'),
                                        isThreeLine: true,
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: FlutterLogo(size: 60.0),
                                        title: Text('Title'),
                                        subtitle: Text('Sub-title'),
                                        isThreeLine: true,
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: FlutterLogo(size: 60.0),
                                        title: Text('Title'),
                                        subtitle: Text('Sub-title'),
                                        isThreeLine: true,
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: FlutterLogo(size: 60.0),
                                        title: Text('Title'),
                                        subtitle: Text('Sub-title'),
                                        isThreeLine: true,
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: FlutterLogo(size: 60.0),
                                        title: Text('Title'),
                                        subtitle: Text('Sub-title'),
                                        isThreeLine: true,
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: FlutterLogo(size: 60.0),
                                        title: Text('Title'),
                                        subtitle: Text('Sub-title'),
                                        isThreeLine: true,
                                      ),
                                    ),
                                    Card(
                                      child: ListTile(
                                        leading: FlutterLogo(size: 60.0),
                                        title: Text('Title'),
                                        subtitle: Text('Sub-title'),
                                        isThreeLine: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListView(
                                children: <Widget>[
                                  Card(
                                    child: ListTile(
                                      leading: FlutterLogo(size: 60.0),
                                      title: Text('Title'),
                                      subtitle: Text('Sub-title'),
                                      isThreeLine: true,
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      leading: FlutterLogo(size: 60.0),
                                      title: Text('Title'),
                                      subtitle: Text('Sub-title'),
                                      isThreeLine: true,
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    )
                  ]),
                )),
//                Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.only(top: 15, left: 25, right: 25),
//                      child: TabBar(
//                        controller: _tabController,
//                        indicatorColor: Colors.green,
//                        tabs: <Widget>[
//                          Container(
//                            padding: EdgeInsets.only(bottom: 10),
//                            child: Text(
//                              "Penyakit",
//                              style: _tabText(),
//                            ),
//                          ),
//                          Container(
//                            padding: EdgeInsets.only(bottom: 10),
//                            child: Text(
//                              "Hama",
//                              style: _tabText(),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Expanded(
//                      child: TabBarView(
//                        controller: _tabController,
//                        children: <Widget>[
//                          Container(
//                            child: ListView(
//                              children: <Widget>[
//                                Card(
//                                  child: ListTile(
//                                    leading: FlutterLogo(size: 60.0),
//                                    title: Text('Title'),
//                                    subtitle: Text('Sub-title'),
//                                    isThreeLine: true,
//                                  ),
//                                ),
//                                Card(
//                                  child: ListTile(
//                                    leading: FlutterLogo(size: 60.0),
//                                    title: Text('Title'),
//                                    subtitle: Text('Sub-title'),
//                                    isThreeLine: true,
//                                  ),
//                                ),
//                                Card(
//                                  child: ListTile(
//                                    leading: FlutterLogo(size: 60.0),
//                                    title: Text('Title'),
//                                    subtitle: Text('Sub-title'),
//                                    isThreeLine: true,
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                          ListView(
//                            children: <Widget>[
//                              Card(
//                                child: ListTile(
//                                  leading: FlutterLogo(size: 60.0),
//                                  title: Text('Title'),
//                                  subtitle: Text('Sub-title'),
//                                  isThreeLine: true,
//                                ),
//                              ),
//                              Card(
//                                child: ListTile(
//                                  leading: FlutterLogo(size: 60.0),
//                                  title: Text('Title'),
//                                  subtitle: Text('Sub-title'),
//                                  isThreeLine: true,
//                                ),
//                              ),
//                            ],
//                          ),
//                        ],
//                      ),
//                    ),
////
//                  ],
//                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _tentangApel() {
    return Container(
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
    );
  }

  static TextStyle _tabText() {
    return TextStyle(fontSize: 16, color: Colors.black);
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
