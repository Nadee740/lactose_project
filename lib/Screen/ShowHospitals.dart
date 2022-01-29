<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';
=======
import 'dart:convert';
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/ShowAmbulance.dart';
import 'package:lactose_project/Screen/ShowLabs.dart';
import 'package:lactose_project/Screen/TestReport.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
>>>>>>> cdce593553c984b4c5a3bc69125c0c60bba85013

class ShowHospitals extends StatefulWidget {
  @override
  _ShowHospitalsState createState() => _ShowHospitalsState();
}

class _ShowHospitalsState extends State<ShowHospitals> {
  bool loading = false;

  List<dynamic> Hospitals = <dynamic>[];
  List<dynamic> FilteredHospitals = <dynamic>[];

  Future<void> getDataFromApi() async {
    var url = "http://10.0.2.2:8000/hospitals";
    var res = await http.get(Uri.parse(url));
    var responsebody = json.decode(res.body);
    print(responsebody['data'][0]['name']);

    setState(() {
      Hospitals = responsebody['data'];
      FilteredHospitals = responsebody['data'];
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
        title: Text("App-Name"),
        centerTitle: true,
        // leading: Icon(
        //   Icons.account_circle_rounded,
        // ),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
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
                    fontWeight: FontWeight.bold,
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
                // Update the state of the app.
                // ...
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
                // Update the state of the app.
                // ...
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
                // Update the state of the app.
                // ...
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
                // Update the state of the app.
                // ...
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
          : SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15.0),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(width: 0.8)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    width: 0.8,
                                    color: Theme.of(context).primaryColor)),
                            hintText: "Search..",
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {})),
                      ),
                    ),
                    for (int i = 0; i < FilteredHospitals.length; i++)
                      Card(
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 125,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(FilteredHospitals[i]['name']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(FilteredHospitals[i]['address']),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(Icons.local_hospital),
                                    ),
                                  ],
                                ),
                                InkWell(
                                    onTap: () {
                                      launch(
                                          "tel://${FilteredHospitals[i]['phone']}");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(Icons.call),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),

                    // Card(
                    //   child: InkWell(
                    //     splashColor: Colors.blue.withAlpha(30),
                    //     onTap: () {
                    //       debugPrint('Card tapped.');
                    //     },
                    //     child: const SizedBox(
                    //       width: double.infinity,
                    //       height: 125,
                    //       child: Text('NEUROlLOGIST'),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: InkWell(
                    //     splashColor: Colors.blue.withAlpha(30),
                    //     onTap: () {
                    //       debugPrint('Card tapped.');
                    //     },
                    //     child: const SizedBox(
                    //       width: double.infinity,
                    //       height: 125,
                    //       child: Text('PEDIATRICIANS'),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: InkWell(
                    //     splashColor: Colors.blue.withAlpha(30),
                    //     onTap: () {
                    //       debugPrint('Card tapped.');
                    //     },
                    //     child: const SizedBox(
                    //       width: double.infinity,
                    //       height: 125,
                    //       child: Text('CARDIOLOGISTS'),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: InkWell(
                    //     splashColor: Colors.blue.withAlpha(30),
                    //     onTap: () {
                    //       debugPrint('Card tapped.');
                    //     },
                    //     child: const SizedBox(
                    //       width: double.infinity,
                    //       height: 125,
                    //       child: Text('GYNECOLOGISTS'),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: InkWell(
                    //     splashColor: Colors.blue.withAlpha(30),
                    //     onTap: () {
                    //       debugPrint('Card tapped.');
                    //     },
                    //     child: const SizedBox(
                    //       width: double.infinity,
                    //       height: 125,
                    //       child: Text('DENTISTS'),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
