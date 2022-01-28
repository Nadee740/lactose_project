import 'package:flutter/material.dart';
import 'package:lactose_project/Screen/Home.dart';
<<<<<<< HEAD
import 'package:lactose_project/Screen/signup.dart';
=======
import 'package:lactose_project/Screen/ShowHospitals.dart';
>>>>>>> d7edb20354e0a76858f50b973a01427da9b6f7a7

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD

      home: SignUp(),
=======
      home: ShowHospitals(),
>>>>>>> d7edb20354e0a76858f50b973a01427da9b6f7a7
    );
  }
}
