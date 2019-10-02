import 'package:flutter/material.dart';
import 'dashboard.dart';


void main() => runApp(DoctorApple());

class DoctorApple extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Doctor Apple",
        debugShowCheckedModeBanner: false, home: MyStatefulWidget());
  }
}
