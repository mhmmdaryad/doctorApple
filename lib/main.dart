import 'package:flutter/material.dart';
import 'package:flutter_app/calculator.dart';
import 'dashboard.dart';
import 'login.dart';


void main() => runApp(DoctorApple());

class DoctorApple extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Doctor Apple",
        debugShowCheckedModeBanner: false, home: LoginScreen3());
  }
}
