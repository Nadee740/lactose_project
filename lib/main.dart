import 'package:flutter/material.dart';
import 'package:lactose_project/Screen/DoctorList.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/Login.dart';
import 'package:lactose_project/Screen/PatientProfile.dart';
import 'package:lactose_project/Screen/ShowDoctorDetails.dart';
import 'package:lactose_project/Screen/ShowHospitals.dart';
import 'package:lactose_project/Screen/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home: DoctorList(),
=======
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xff17edf1),
        ),
      ),
      home: PatientProfile(),
>>>>>>> 2513c81394f27c0b84180e141f67ffa181cf870c
    );
  }
}
