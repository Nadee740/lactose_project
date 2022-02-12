import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:lactose_project/Screen/BookAppointment.dart';
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/Login.dart';
import 'package:lactose_project/Screen/PatientProfile.dart';
import 'package:lactose_project/Screen/ShowAmbulance.dart';
import 'package:lactose_project/Screen/ShowHospitals.dart';
import 'package:lactose_project/Screen/ShowLabs.dart';
import 'package:lactose_project/Screen/TestReport.dart';
import 'package:lactose_project/Screen/feedback.dart';
import 'package:lactose_project/Screen/signup.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key? key,required this.spec}) : super(key: key);
   final String spec;
  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {

  bool loading = false;

  List<dynamic> Doctors = <dynamic>[];
  List<dynamic> FilteredDoctors = <dynamic>[];

  Future<void> getDataFromApi() async {
    var url = "https://lactose-backend.herokuapp.com/doctors?specification=${widget.spec}";
    var res = await http.get(Uri.parse(url));
    var responsebody = json.decode(res.body);
    print(responsebody['data'][0]['name']);

    setState(() {
      Doctors = responsebody['data'];
      FilteredDoctors = responsebody['data'];
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
    print(widget.spec);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MedCo",
          style: TextStyle(
              fontFamily: 'f',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        // leading: Icon(
        //   Icons.account_circle_rounded,
        // ),
        actions: <Widget>[
          Container(
            child: IconButton(
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
                'Hospital',
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
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15.0),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Search By Hospitals",
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            color: Colors.black,
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              //on pressed
                            },
                          ),
                        ),
                      ),
                    ),
                    for (int i = 0; i < FilteredDoctors.length; i++)
                      Card(
                        child: Container(
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
                                height: 15,
                              ),
                              Container(
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
                              RatingBar.builder(
                                itemSize: 25,
                                initialRating: i / 2 == 0
                                    ? 3
                                    : i / 3 == 0
                                        ? 2
                                        : 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  debugPrint('Card tapped.');
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 125,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                          child: Text(
                                        FilteredDoctors[i]['name'].toString(),
                                        style: TextStyle(
                                          fontFamily: 'f',
                                          fontSize: 15,
                                        ),
                                      )),
                                      Text(
                                        FilteredDoctors[i]['job_position']
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: 'f',
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        FilteredDoctors[i]['specification'],
                                        style: TextStyle(
                                          fontFamily: 'f',
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 50,
                                        width: 300,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            //to set border radius to button
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          color: Color(0xff17edf1),
                                          child: Text(
                                            "Book Appointment",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'f',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return BookAppointment(docid: FilteredDoctors[i]['_id']);
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ]))),
    );
  }
}
