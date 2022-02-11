import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/TestReport.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  bool loading = false;



  late Map<String, dynamic> Data;

  Future<void> getDataFromApi() async {
    final storage = new FlutterSecureStorage();

    var url = "https://lactose-backend.herokuapp.com/users/me";
    var token = await storage.read(key: "jwtToken");

    var res = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer ${token}'
      },
    );
    // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWY0ZmY0NmI2ZGZmZDZiMmMzNmFiNGUiLCJpYXQiOjE2NDM0NDYwODZ9.ETka6u8ShfXmpMNW7dTX_dHsCzeRYhJ8d2yeYXey1u0
    var responsebody = json.decode(res.body);

    print(responsebody['data'].runtimeType);
    setState(() {
      Data = responsebody['data'];

      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading = true;
    });
    getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? Container(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.cyan,
                  ),
                ),
              )
            : Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff96f47e), Color(0xff17edf1)])),
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage("ddata:image/jpeg;base64,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ata:image/jpeg;base64,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"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: IconButton(
                                  alignment: Alignment.topRight,
                                  icon: Icon(
                                    Icons.home,
                                    color: Colors.black,
                                    size: 50,
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return Home();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                width: double.infinity,
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
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
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
                            fontSize: 12.0,
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
                            fontSize: 12.0,
                            color: Colors.black45,
                            letterSpacing: 1.0,
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
                            fontSize: 12.0,
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
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return CurrAppointment();
                                  },
                                ),
                              );
                            },
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
                            onPressed: (){

                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
  }
}
