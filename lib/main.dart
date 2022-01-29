import 'dart:convert';

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:lactose_project/Screen/BookAppointment.dart';
=======
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
>>>>>>> cdce593553c984b4c5a3bc69125c0c60bba85013
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/DoctorList.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/Login.dart';
import 'package:lactose_project/Screen/PatientProfile.dart';
import 'package:lactose_project/Screen/ShowAmbulance.dart';
import 'package:lactose_project/Screen/ShowDoctorDetails.dart';
import 'package:lactose_project/Screen/ShowHospitals.dart';
import 'package:lactose_project/Screen/ShowLabs.dart';
import 'package:lactose_project/Screen/TestReport.dart';
import 'package:lactose_project/Screen/signup.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,


      home: BookAppointment(),


=======
      home: Home(),
>>>>>>> cdce593553c984b4c5a3bc69125c0c60bba85013
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xff17edf1),
        ),
      ),
    );
  }
}

Future<bool> checkLogin() async {
  final storage = new FlutterSecureStorage();

  var url = "http://10.0.2.2:8000/users/me";
  var token = await storage.read(key: "jwtToken");

  var res = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${token}'
    },
  );
  // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWY0ZmY0NmI2ZGZmZDZiMmMzNmFiNGUiLCJpYXQiOjE2NDM0NDYwODZ9.ETka6u8ShfXmpMNW7dTX_dHsCzeRYhJ8d2yeYXey1u0
  var responsebody = json.decode(res.body);
  print(responsebody);
  return responsebody['error'] ? false : true;
}
