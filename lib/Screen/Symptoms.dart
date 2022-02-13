// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lactose_project/Db/Urlclass.dart';
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/Feedback.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/PatientProfile.dart';
import 'package:lactose_project/Screen/ShowAmbulance.dart';
import 'package:lactose_project/Screen/ShowHospitals.dart';
import 'package:lactose_project/Screen/ShowLabs.dart';
import 'package:lactose_project/Screen/TestReport.dart';
import 'package:http/http.dart' as http;
class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  _SymptomsState createState() => _SymptomsState();
}
bool isloading=false;
bool selected1 = false;
bool selected2 = false;
bool selected3 = false;
bool selected4 = false;
bool selected5 = false;
var diseasedata;
int i=0;
List<String> symptoms = ["fever","cough","comiting","headache","stomach pain","body weakness","+other"];
List<String> selectedsymptoms=[];
class _SymptomsState extends State<Symptoms> {
  List selected=[];
  void SubmitSymptoms()async{
    setState(() {
      isloading=true;
    });
    var res = await http.post(
      Uri.parse('${Urlclass.url}symptoms'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',

      },
      body: jsonEncode(<String, dynamic>{
      'symptoms':selectedsymptoms
      }),
    );
    var responsebody = json.decode(res.body);
    setState(() {

      if(responsebody['data'].length>0)
         diseasedata=responsebody['data'][0];
      isloading=false;
      showAlertDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
   for(int i=0;i<symptoms.length;i++)
       selected.add(false);

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
      body:isloading? Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.cyan,
          ),
        ),
      ):Container(
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
              height: 100,
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
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 15,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ),
              ], borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: [
                   for(int i=0;i<symptoms.length;i++)
                     Container(
                       child: FilterChip(
                         label: Text('${symptoms[i]}'),
                         selected: selected[i],
                         selectedColor: Color(0xff17edf1),
                         elevation: 10,
                         pressElevation: 5,
                         onSelected: (bool value) {

                           setState(() {
                             selected[i] = value;
                             if(value)
                             selectedsymptoms.add(symptoms[i]);
                             else
                               selectedsymptoms.remove(symptoms[i]);
                           });

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
                  onPressed: () {
                    SubmitSymptoms();
                    // print('hi');
                    // showAlertDialog(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Stack(
      children: [
        Icon(Icons.home),
      ],
    ),
    onPressed: () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return Home();
              }));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(
      child: Text(
        "Search Result..!",
        style: TextStyle(
          fontFamily: 'f',
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diseases:',
              style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              diseasedata!=null?'${diseasedata['name']}':"no diesese found",
              style: TextStyle(
                fontFamily: 'f',
                fontSize: 18,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Precautions:',
              style: TextStyle(
                  fontFamily: 'f',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              diseasedata!=null?'${diseasedata['precaution']}':"no diesese found",
              style: TextStyle(
                  fontFamily: 'f', fontSize: 18, fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ),
    ),
    actions: [
      cancelButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async {
            return true;
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (BuildContext context) {
            //   return Home();
            // }));
          },
          child: alert);
    },
  );

}
