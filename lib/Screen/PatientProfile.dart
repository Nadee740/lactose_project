import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  bool loading=false;

  late Map<String,dynamic> Data;


  Future<void> getDataFromApi() async {

    final storage = new FlutterSecureStorage();

    var url = "http://10.0.2.2:8000/users/me";
    var token = await storage.read(key: "jwtToken");

    var res = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWY0ZmY0NmI2ZGZmZDZiMmMzNmFiNGUiLCJpYXQiOjE2NDM0NDYwODZ9.ETka6u8ShfXmpMNW7dTX_dHsCzeRYhJ8d2yeYXey1u0'
    },);
    // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWY0ZmY0NmI2ZGZmZDZiMmMzNmFiNGUiLCJpYXQiOjE2NDM0NDYwODZ9.ETka6u8ShfXmpMNW7dTX_dHsCzeRYhJ8d2yeYXey1u0
    var responsebody=json.decode(res.body);

  print(responsebody['data'].runtimeType);
    setState(() {
      Data=responsebody['data'];

      loading=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading=true;
    });
    getDataFromApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:loading?Container(height: MediaQuery.of(context).size.height,child: Center(child: CircularProgressIndicator(backgroundColor: Colors.cyan,),),) :Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff96f47e), Color(0xff17edf1)])),
            height: MediaQuery.of(context).size.height / 2,
            child: Column(children: [
              Container(

                child: Container(
                  width: double.infinity,
                  height: 170,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 130,
                      ),
                      backgroundColor: Color(0xff1182d0),
                      radius: 65.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                Data['name'],
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'f',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "age:${Data['age']}",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'f',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                Data['place'],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'f',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${Data['phone']} || ${Data['email']}",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'f',
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 70,
          ),
          Column(
            children: [
              Container(
                width: 300,
                height: 70,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Color(0xff17edf1),
                  child: Text(
                    "Appointment",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'f',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 300,
                height: 70,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Color(0xff17edf1),
                  child: Text(
                    "Report",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'f',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
