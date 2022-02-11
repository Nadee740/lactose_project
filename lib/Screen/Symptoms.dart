// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/Feedback.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/PatientProfile.dart';
import 'package:lactose_project/Screen/ShowAmbulance.dart';
import 'package:lactose_project/Screen/ShowHospitals.dart';
import 'package:lactose_project/Screen/ShowLabs.dart';
import 'package:lactose_project/Screen/TestReport.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  _SymptomsState createState() => _SymptomsState();
}

bool selected1 = false;
bool selected2 = false;
bool selected3 = false;
bool selected4 = false;

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MedCo",
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PatientProfile();
                  },
                ),
              );
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
                  'MedCo',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Home();
                    },
                  ),
                );
                // Update the state of the app.
                // ...
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
                Navigator.push(
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
                Navigator.push(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ShowHospitals();
                    },
                  ),
                );
                // Update the state of the app.
                // ...
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
                Navigator.push(
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
                Navigator.push(
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff96f47e), Color(0xff17edf1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Select  symptoms:',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'f', fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: [
                    Container(
                      child: FilterChip(
                        label: Text('Fever'),
                        selected: selected1,
                        onSelected: (bool value) {
                          selected1 = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: FilterChip(
                        label: Text('Cough'),
                        selected: selected2,
                        onSelected: (bool value) {
                          selected2 = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: FilterChip(
                        label: Text('Vomiting'),
                        selected: selected3,
                        onSelected: (bool value) {
                          selected3 = value;
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      child: FilterChip(
                        label: Text('Vomiting'),
                        selected: selected4,
                        onSelected: (bool value) {
                          selected4 = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 150,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff17edf1),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontFamily: 'f',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
