import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lactose_project/Db/Urlclass.dart';
import 'package:http/http.dart' as http;
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/Login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = new FlutterSecureStorage();
  void checkLogin()async{
    var url = "${Urlclass.url}users/me";
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

    if(responsebody['status'] == "failed")
    { print('hy');
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return LoginPage();
          }));
    }
    else {
      print("hyaaa");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return Home();
          }));
    }
  }
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    checkLogin();

  }
  @override
  Widget build(BuildContext context) {
    print("hyayyyee");
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash.jpg",width:200 ,),
            SizedBox(height: 0,),
            Text("MedCo",style: TextStyle(fontSize: 25,fontFamily: 'f'),)
          ],
        ),
      ),
    );
  }
}
