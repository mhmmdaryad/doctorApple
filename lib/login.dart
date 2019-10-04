import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dashboard.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}

class LoginScreen3 extends StatefulWidget {
  @override
  _LoginScreen3State createState() => new _LoginScreen3State();
}

class _LoginScreen3State extends State<LoginScreen3>
    with TickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  Widget HomePage() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: new Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/tumap.png'),
                    fit: BoxFit.fill)),
            height: 470,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/logoC.png'),
            )),
            height: 120,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 50.0, right: 60.0, top: 260.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/caption.png'),
            )),
            height: 15,
          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 400.0),
//            alignment: Alignment.center,
//            child: new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new RaisedButton(
//                    shape: new RoundedRectangleBorder(
//                        borderRadius: new BorderRadius.circular(30.0)),
//                    color: Colors.green,
//                    onPressed: () => gotoSignup(),
//                    child: new Container(
//                      padding: const EdgeInsets.symmetric(
//                        vertical: 20.0,
//                        horizontal: 20.0,
//                      ),
//                      child: new Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          new Expanded(
//                            child: Text(
//                              "DAFTAR",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
              new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 480.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(left: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: Colors.blueAccent,
                            onPressed: () => {},
                            child: new Container(
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      onPressed: () {
                                        signInWithGoogle().whenComplete(() {
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => MyStatefulWidget()
                                          ));
                                        });
                                      },
                                      padding: EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Image.asset("assets/icon/google.png",
                                          height: 50,),
                                          Text(
                                            "GOOGLE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//  Widget LoginPage() {
//    return Scaffold(
//      body: new Container(
//      height: MediaQuery.of(context).size.height,
//      decoration: BoxDecoration(
//        color: Colors.white,
//        image: DecorationImage(
//          colorFilter: new ColorFilter.mode(
//              Colors.black.withOpacity(0.05), BlendMode.dstATop),
//          image: AssetImage('assets/images/mountains.jpg'),
//          fit: BoxFit.cover,
//        ),
//      ),
//      child: new Column(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(top : 50.0,bottom: 25),
//            child: Center(
//              child: Icon(
//                Icons.person,
//                color: Colors.green,
//                size: 120.0,
//              ),
//            ),
//          ),
//          new Row(
//            children: <Widget>[
//              new Expanded(
//                child: new Padding(
//                  padding: const EdgeInsets.only(left: 40.0),
//                  child: new Text(
//                    "EMAIL",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.green,
//                      fontSize: 15.0,
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//            alignment: Alignment.center,
//            decoration: BoxDecoration(
//              border: Border(
//                bottom: BorderSide(
//                    color: Colors.green,
//                    width: 0.5,
//                    style: BorderStyle.solid),
//              ),
//            ),
//            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//            child: new Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                new Expanded(
//                  child: TextField(
//                    obscureText: true,
//                    textAlign: TextAlign.left,
//                    decoration: InputDecoration(
//                      border: InputBorder.none,
//                      hintText: 'penunggu_lab@awp.com',
//                      hintStyle: TextStyle(color: Colors.grey),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Divider(
//            height: 24.0,
//          ),
//          new Row(
//            children: <Widget>[
//              new Expanded(
//                child: new Padding(
//                  padding: const EdgeInsets.only(left: 40.0),
//                  child: new Text(
//                    "PASSWORD",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.green,
//                      fontSize: 15.0,
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//            alignment: Alignment.center,
//            decoration: BoxDecoration(
//              border: Border(
//                bottom: BorderSide(
//                    color: Colors.green,
//                    width: 0.5,
//                    style: BorderStyle.solid),
//              ),
//            ),
//            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//            child: new Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                new Expanded(
//                  child: TextField(
//                    obscureText: true,
//                    textAlign: TextAlign.left,
//                    decoration: InputDecoration(
//                      border: InputBorder.none,
//                      hintText: '*********',
//                      hintStyle: TextStyle(color: Colors.grey),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Divider(
//            height: 24.0,
//          ),
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(right: 20.0),
//                child: new FlatButton(
//                  child: new Text(
//                    "Forgot Password?",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.green,
//                      fontSize: 15.0,
//                    ),
//                    textAlign: TextAlign.end,
//                  ),
//                  onPressed: () => {},
//                ),
//              ),
//            ],
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
//            alignment: Alignment.center,
//            child: new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new FlatButton(
//                    shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(30.0),
//                    ),
//                    color: Colors.green,
//                    onPressed: () => {},
//                    child: new Container(
//                      padding: const EdgeInsets.symmetric(
//                        vertical: 20.0,
//                        horizontal: 20.0,
//                      ),
//                      child: new Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          new Expanded(
//                            child: Text(
//                              "MASUK",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
//            alignment: Alignment.center,
//            child: Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new Container(
//                    margin: EdgeInsets.all(8.0),
//                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
//                  ),
//                ),
//                Text(
//                  "ATAU HUBUNGKAN DENGAN",
//                  style: TextStyle(
//                    color: Colors.grey,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//                new Expanded(
//                  child: new Container(
//                    margin: EdgeInsets.all(8.0),
//                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
//            child: new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new Container(
//                    margin: EdgeInsets.only(left: 8.0),
//                    alignment: Alignment.center,
//                    child: new Row(
//                      children: <Widget>[
//                        new Expanded(
//                          child: new FlatButton(
//                            shape: new RoundedRectangleBorder(
//                              borderRadius: new BorderRadius.circular(30.0),
//                            ),
//                            color: Colors.blueAccent,
//                            onPressed: () => {},
//                            child: new Container(
//                              child: new Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  new Expanded(
//                                    child: new FlatButton(
//                                      onPressed: ()=>{},
//                                      padding: EdgeInsets.only(
//                                        top: 5.0,
//                                        bottom: 5.0,
//                                      ),
//                                      child: new Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceEvenly,
//                                        children: <Widget>[
//                                          Image.asset("assets/icon/google.png",
//                                          height: 50,),
//                                          Text(
//                                            "GOOGLE",
//                                            textAlign: TextAlign.center,
//                                            style: TextStyle(
//                                                color: Colors.white,
//                                                fontWeight: FontWeight.bold),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    ));
//  }


//  Widget SignupPage() {
//    return Scaffold(
//      body: Container(
//      height: MediaQuery.of(context).size.height,
//      decoration: BoxDecoration(
//        color: Colors.white,
//        image: DecorationImage(
//          colorFilter: new ColorFilter.mode(
//              Colors.black.withOpacity(0.05), BlendMode.dstATop),
//          image: AssetImage('assets/images/mountains.jpg'),
//          fit: BoxFit.cover,
//        ),
//      ),
//      child: new Column(
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(top: 50.0,bottom: 25,),
//            child: Center(
//              child: Icon(
//                Icons.person_add,
//                color: Colors.green,
//                size: 120.0,
//              ),
//            ),
//          ),
//          new Row(
//            children: <Widget>[
//              new Expanded(
//                child: new Padding(
//                  padding: const EdgeInsets.only(left: 40.0),
//                  child: new Text(
//                    "EMAIL",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.green,
//                      fontSize: 15.0,
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//            alignment: Alignment.center,
//            decoration: BoxDecoration(
//              border: Border(
//                bottom: BorderSide(
//                    color: Colors.green,
//                    width: 0.5,
//                    style: BorderStyle.solid),
//              ),
//            ),
//            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//            child: new Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                new Expanded(
//                  child: TextField(
//                    obscureText: true,
//                    textAlign: TextAlign.left,
//                    decoration: InputDecoration(
//                      border: InputBorder.none,
//                      hintText: 'siangmalam@awp.com',
//                      hintStyle: TextStyle(color: Colors.grey),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Divider(
//            height: 24.0,
//          ),
//          new Row(
//            children: <Widget>[
//              new Expanded(
//                child: new Padding(
//                  padding: const EdgeInsets.only(left: 40.0),
//                  child: new Text(
//                    "PASSWORD",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.green,
//                      fontSize: 15.0,
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//            alignment: Alignment.center,
//            decoration: BoxDecoration(
//              border: Border(
//                bottom: BorderSide(
//                    color: Colors.green,
//                    width: 0.5,
//                    style: BorderStyle.solid),
//              ),
//            ),
//            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//            child: new Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                new Expanded(
//                  child: TextField(
//                    obscureText: true,
//                    textAlign: TextAlign.left,
//                    decoration: InputDecoration(
//                      border: InputBorder.none,
//                      hintText: '*********',
//                      hintStyle: TextStyle(color: Colors.grey),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Divider(
//            height: 24.0,
//          ),
//          Row(
//            children: <Widget>[
//              new Expanded(
//                child: new Padding(
//                  padding: const EdgeInsets.only(left: 40.0),
//                  child: new Text(
//                    "KONFIRMASI PASSWORD",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.green,
//                      fontSize: 15.0,
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
//            alignment: Alignment.center,
//            decoration: BoxDecoration(
//              border: Border(
//                bottom: BorderSide(
//                    color: Colors.green,
//                    width: 0.5,
//                    style: BorderStyle.solid),
//              ),
//            ),
//            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
//            child: new Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                new Expanded(
//                  child: TextField(
//                    obscureText: true,
//                    textAlign: TextAlign.left,
//                    decoration: InputDecoration(
//                      border: InputBorder.none,
//                      hintText: '*********',
//                      hintStyle: TextStyle(color: Colors.grey),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//          Divider(
//            height: 24.0,
//          ),
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(right: 20.0),
//                child: new FlatButton(
//                  child: new Text(
//                    "Sudah Punya Akun?",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.green,
//                      fontSize: 15.0,
//                    ),
//                    textAlign: TextAlign.end,
//                  ),
//                  onPressed: () => {},
//                ),
//              ),
//            ],
//          ),
//          new Container(
//            width: MediaQuery.of(context).size.width,
//            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
//            alignment: Alignment.center,
//            child: new Row(
//              children: <Widget>[
//                new Expanded(
//                  child: new FlatButton(
//                    shape: new RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(30.0),
//                    ),
//                    color: Colors.green,
//                    onPressed: () => {},
//                    child: new Container(
//                      padding: const EdgeInsets.symmetric(
//                        vertical: 20.0,
//                        horizontal: 20.0,
//                      ),
//                      child: new Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          new Expanded(
//                            child: Text(
//                              "DAFTAR",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    ));
//
//  }

  gotoLogin() {
    //controller_0To1.forward(from: 0.0);
    _controller.animateToPage(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  gotoSignup() {
    //controller_minus1To0.reverse(from: 0.0);
    _controller.animateToPage(
      2,
      duration: Duration(milliseconds: 800),
      curve: Curves.bounceOut,
    );
  }

  PageController _controller =
      new PageController(initialPage: 1, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _controller,
          physics: new AlwaysScrollableScrollPhysics(),
          children: <Widget>[HomePage()],
          scrollDirection: Axis.horizontal,
        ));
  }
}
