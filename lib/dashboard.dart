import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'camera.dart';
import 'phDetails.dart';
import 'x.dart';
import 'calculator.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static TabController _tabController;
  static FocusNode _focusNode;
  List<Widget> _widgetOption;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _tabController = TabController(length: 2, vsync: this);
    _widgetOption = <Widget>[
      _beranda(context),
      _penyakitSolusi(context),
      _tentangApel(context)
    ];
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
        onPressed: () {
          main();
//          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
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

  Widget _beranda(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
//            padding: EdgeInsets.only(top: 130,) ,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/back.png'),
                    fit: BoxFit.fill)),
            height: 700,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 130, left: 130),
              child: new Image.asset('assets/image/buahApel.png'),
            ),
          ),
          Container(
//            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 20.0, right: 60.0, top: 20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/logoB.png'),
            )),
            height: 120,
          ),
          Container(
            padding: EdgeInsets.only(top: 400, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyCustomForm())),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: Image.asset('assets/icon/kalkulator.png'),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            child: Text('Kalkulator Pupuk',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  height: 150,
                  width: 150,
                ),
                Container(
                  child: Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: Image.asset('assets/icon/pakar.png'),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 15,
                            ),
                            child: Text('Tanya Pakar',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            height: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  height: 150,
                  width: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _penyakitSolusi(BuildContext context) {
    _focusNode = FocusNode();
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/header2.png'),
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
                        child:
                            TabBarView(controller: _tabController, children: <
                                Widget>[
                          Container(
                            child: ListView(
                              children: <Widget>[
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => phDetails(
                                                    title: 'Embun Tepung',
                                                    gejala:
                                                        x().Embun_Tepung_gejala,
                                                    penyebab: x()
                                                        .Embun_Tepung_penyebab,
                                                    description: x()
                                                        .tepung_deskripsi_string,
                                                    solusi: x().Embun_Tepung_solusi,
                                                    image: AssetImage(
                                                        "assets/image/embuntep.jpg"),
                                                  )));
                                    },
                                    leading:
                                        Image.asset("assets/icon/Hemtep.png"),
                                    title: Text('Embun Tepung'),
                                    subtitle: Text('Podosphaera Leucoticha',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic)),
                                    isThreeLine: true,
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => phDetails(
                                                    title: "Bitter Rot",
                                                    gejala:
                                                        x().Bitter_Rot_Gejala,
                                                    penyebab:
                                                        x().Bitter_Rot_penyebab,
                                                    description: x()
                                                        .Bitter_Rot_deskripsi,
                                                    solusi:
                                                        x().Bitter_Rot_Solusi,
                                                    image: AssetImage(
                                                        "assets/image/bitrot.png"),
                                                  )));
                                    },
                                    leading:
                                        Image.asset("assets/icon/Hbitrot.png"),
                                    title: Text('Bitter Rot'),
                                    subtitle: Text('Fungus: Colletotrichum sp',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic)),
                                    isThreeLine: true,
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => phDetails(
                                                    title: "Busuk Api",
                                                    gejala:
                                                        x().Bitter_Rot_Gejala,
                                                    penyebab:
                                                        x().Busuk_Api_penyebab,
                                                    description:
                                                        x().Busuk_Api_deskripsi,
                                                    solusi:
                                                        x().Busuk_Api_Solusi,
                                                    image: AssetImage(
                                                        "assets/image/busap.png"),
                                                  )));
                                    },
                                    leading:
                                        Image.asset("assets/icon/Hbusap.png"),
                                    title: Text('Busuk Api'),
                                    subtitle: Text('Erwinia Amylovara',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic)),
                                    isThreeLine: true,
                                  ),
                                ),

                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => phDetails(
                                                    title: "Black Rot",
                                                    gejala:
                                                        x().Black_Rot_Gejala,
                                                    penyebab:
                                                        x().Black_Rot_Penyebab,
                                                    description:
                                                        x().Black_Rot_deskripsi,
                                                    solusi:
                                                        x().Black_Rot_Solusi,
                                                    image: AssetImage(
                                                        "assets/image/blakrot.png"),
                                                  )));
                                    },
                                    leading:
                                        Image.asset("assets/icon/Hblarot.png"),
                                    title: Text('Black rot'),
                                    subtitle: Text(
                                        'Fungus: Botryosphaeriaobtusa',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic)),
                                    isThreeLine: true,
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => phDetails(
                                                    title: "Keropeng Apel",
                                                    gejala: x()
                                                        .keropeng_Gejala_string,
                                                    penyebab: x()
                                                        .keropeng_Gejala_string,
                                                    description: x()
                                                        .keropeng_deskripsi_string,
                                                    solusi: x()
                                                        .keropeng_Solusi_string,
                                                    image: AssetImage(
                                                        "assets/image/keropel.png"),
                                                  )));
                                    },
                                    leading:
                                        Image.asset("assets/icon/Hscab.png"),
                                    title: Text('Keropeng Apel'),
                                    subtitle: Text(
                                        'Fungus: Venturia inaequalis',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic)),
                                    isThreeLine: true,
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => phDetails(
                                                    title: "Bercak Daun",
                                                    gejala:
                                                        x().Bercak_Daun_gejala,
                                                    penyebab: x()
                                                        .Bercak_Daun_penyebab,
                                                    description: x()
                                                        .Bercak_Daun_deskripsi,
                                                    solusi:
                                                        x().Bercak_Daun_solusi,
                                                    image: AssetImage(
                                                        "assets/image/berda.png"),
                                                  )));
                                    },
                                    leading:
                                        Image.asset("assets/icon/Hberda.png"),
                                    title: Text('Bercak Daun'),
                                    subtitle: Text('Marssonina coronaria',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic)),
                                    isThreeLine: true,
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => phDetails(
                                                    title: "Busuk Akar",
                                                    gejala:
                                                        x().Busuk_Akar_gejala,
                                                    penyebab:
                                                        x().Busuk_Akar_penyebab,
                                                    description: x()
                                                        .Busuk_Akar_deskripsi,
                                                    solusi:
                                                        x().Busuk_Akar_solusi,
                                                    image: AssetImage(
                                                        "assets/image/bukar.png"),
                                                  )));
                                    },
                                    leading:
                                        Image.asset("assets/icon/Hbusar.png"),
                                    title: Text('Busuk Akar'),
                                    subtitle: Text('Armilliaria Melea',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic)),
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => phDetails(
                                                  title: "Lalat Buah",
                                                  gejala: x().Lalat_Buah_gejala,
                                                  penyebab:
                                                      x().Lalat_buah_Penyebab,
                                                  description:
                                                      x().Lalat_buah_deskripsi,
                                                  solusi: x().Lalat_Buah_solusi,
                                                  image: AssetImage(
                                                      "assets/image/labu.png"),
                                                )));
                                  },
                                  leading: Image.asset("assets/icon/Hlabu.png"),
                                  title: Text('Lalat Buah'),
                                  subtitle: Text('Rhagoletis Pomonella ',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic)),
                                  isThreeLine: true,
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => phDetails(
                                                  title: "Kelelawar",
                                                  gejala: x().Kelelawar_gejala,
                                                  penyebab:
                                                      x().Kelelawar_penyebab,
                                                  description:
                                                      x().Kelelawar_deskripsi,
                                                  solusi: x().Kelelawar_Solusi,
                                                  image: AssetImage(
                                                      "assets/image/kelelawar.png"),
                                                )));
                                  },
                                  leading:
                                      Image.asset("assets/icon/Hkekel.png"),
                                  title: Text('Kelelawar'),
                                  subtitle: Text(''),
                                  isThreeLine: true,
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => phDetails(
                                                  title:
                                                      "Plum Curculio (Kumbang)",
                                                  gejala:
                                                      x().Plum_Curculio_gejala,
                                                  penyebab: x()
                                                      .Plum_Curculio_penyebab,
                                                  description: x()
                                                      .Plum_Curculio_deskripsi,
                                                  solusi:
                                                      x().Plum_Curculio_solusi,
                                                  image: AssetImage(
                                                      "assets/image/plum.png"),
                                                )));
                                  },
                                  leading: Image.asset("assets/icon/Hplum.png"),
                                  title: Text('Plum Curculio (kumbang)'),
                                  subtitle: Text('Conotrochelus Nenuphar',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic)),
                                  isThreeLine: true,
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => phDetails(
                                                  title: "Ulat Daun",
                                                  gejala: x().Ulat_Daun_gejala,
                                                  penyebab:
                                                      x().Ulat_Daun_penyebab,
                                                  description:
                                                      x().Ulat_Daun_deskripsi,
                                                  solusi: x().Ulat_Daun_solusi,
                                                  image: AssetImage(
                                                      "assets/image/ulatdaun.png"),
                                                )));
                                  },
                                  leading: Image.asset("assets/icon/Huda.png"),
                                  title: Text('Ulat Daun'),
                                  subtitle: Text('Spodoptera Litura',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic)),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tentangApel(BuildContext context) {
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
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Text(
                          'Tentang\nApel',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                  height: 150,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 30, top: 10),
                            child: Image.asset("assets/icon/ketinggian.png"),
                          ),
                        ),
                        height: 120,
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 30, top: 10),
                              child: Text(
                                'Ketinggian',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 60, right: 20, top: 10),
                          child: Text(
                            x().ketinggian_string,
                          ),
                        ),
                        height: 80,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Image.asset("assets/icon/tanah.png"),
                          ),
                        ),
                        height: 120,
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                'Tanah',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 50, top: 10),
                          child: Text(
                            x().tanah_string,
                          ),
                        ),
                        height: 80,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 30, top: 10),
                            child: Image.asset("assets/icon/hujan.png"),
                          ),
                        ),
                        height: 120,
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 30, top: 10),
                              child: Text(
                                'Curah Hujan',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 100, right: 20, top: 10),
                          child: Text(
                            x().hujan_string,
                          ),
                        ),
                        height: 80,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Image.asset("assets/icon/matahari.png"),
                          ),
                        ),
                        height: 120,
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                'Cahaya Matahari',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Text(
                            x().matahari_string,
                          ),
                        ),
                        height: 60,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Image.asset("assets/icon/suhu.png"),
                          ),
                        ),
                        height: 120,
                      ),
                      Container(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Text(
                                'Suhu',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Text(
                            x().suhu_string,
                          ),
                        ),
                        height: 80,
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

  gotoCalculate() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  Future<String> loadAsset(BuildContext context) async {
    return await DefaultAssetBundle.of(context)
        .loadString('assets/text/embunTepung.txt');
  }

  static TextStyle _tabText() {
    return TextStyle(fontSize: 16, color: Colors.black);
  }
}
