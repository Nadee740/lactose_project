import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lactose_project/Screen/Feedback.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/PatientProfile.dart';
import 'package:lactose_project/Screen/ShowAmbulance.dart';
import 'package:lactose_project/Screen/ShowHospitals.dart';
import 'package:lactose_project/Screen/ShowLabs.dart';
import 'package:lactose_project/Screen/TestReport.dart';

class CurrAppointment extends StatefulWidget {
  const CurrAppointment({Key? key}) : super(key: key);

  @override
  State<CurrAppointment> createState() => _CurrAppointmentState();
}

class _CurrAppointmentState extends State<CurrAppointment> {
  Map Appointments = Map<String, dynamic>();
  bool loading = false;
  Future<void> getDataFromApi() async {
    final storage = new FlutterSecureStorage();

    var url = "http://10.0.2.2:8000/appointments/me";
    var token = await storage.read(key: "jwtToken");

    var res = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWYzYjMzMDk4ZGMzZGEwNThhNGFiM2UiLCJpYXQiOjE2NDMzNjEwNzN9.r9L2BWz3H6hI6DYUpqQzXWj69RAJ9DkgqgHz3xm6y1o'
      },
    );
    // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWY0ZmY0NmI2ZGZmZDZiMmMzNmFiNGUiLCJpYXQiOjE2NDM0NDYwODZ9.ETka6u8ShfXmpMNW7dTX_dHsCzeRYhJ8d2yeYXey1u0
    var responsebody = json.decode(res.body);
    var url2 = "http://10.0.2.2:8000/doctor/61f52bd822ea8a21cc1edab6";
    var drres = await http.get(
      Uri.parse(url2),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var responsebodydr = json.decode(drres.body);
    var url3 = "http://10.0.2.2:8000/hospital/61f3a7172d4cbe443c39d66b";
    var hospres = await http.get(
      Uri.parse(url3),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var responsebodyhosp = json.decode(hospres.body);
    print(responsebody);
    print(responsebodydr);
    print(responsebodyhosp);
    setState(() {
      Appointments = {
        'res': responsebody[responsebody.length - 1],
        'dr': responsebodydr['data'],
        'hosp': responsebodyhosp['data']
      };

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
      appBar: AppBar(
        title: Text(
          "App-Name",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'f',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PatientProfile();
                  },
                ),
              );
              // do something
            },
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,

        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff96f47e), Color(0xff17edf1)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Center(
                child: Text(
                  'App-Name',
                  style: TextStyle(
                    fontFamily: 'f',
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 25,
                ),
              ),
              onTap: () {
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
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              selectedTileColor: Colors.grey[300],
              title: const Text(
                'Appointment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 25,
                ),
              ),
              onTap: () {
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
            ListTile(
              title: const Text(
                'Test Report',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TestReport();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Hospitals',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ShowHospitals();
                    },
                  ),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Lab',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ShowsLabs();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Ambulance',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ShowAmbulance();
                    },
                  ),
                );
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text(
                'Send Feedback',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return FeedbackPage();
                    },
                  ),
                );
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
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
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 1.4,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width / 1.2,
                        color: Color(0xff17edf1),
                        child: Center(
                          child: Text(
                            "Appointment",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'f',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Icon(
                          Icons.alarm_on_outlined,
                          size: 90,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        child: Text(
                          "Session Booked!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontFamily: 'f'),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [Color(0xff96f47e), Color(0xff17edf1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                            Container(
                              child: Text(
                                "Doctor: ${Appointments['dr']['name']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'f',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              child: Text(
                                Appointments['res']['date'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'f',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              child: Text(
                                "Hospital:${Appointments['hosp']['name']}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'f',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
