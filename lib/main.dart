import 'package:flutter/material.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/Login.dart';
import 'package:lactose_project/Screen/ShowHospitals.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: LoginPage(),

    );
  }
}
