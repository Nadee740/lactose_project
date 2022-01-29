import 'package:flutter/material.dart';
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/PatientProfile.dart';
import 'package:timelines/timelines.dart';

class TestReport extends StatelessWidget {
  const TestReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App-Name ",
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
              onTap: () {},
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
              onTap: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new Stack(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: new Card(
                  margin: new EdgeInsets.all(20.0),
                  child: new Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'f',
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.002,
                        ),
                        Text(
                          "Time",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'f',
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 30,
                          ),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            "more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'f',
                            ),
                          ),
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 200,
                    color: Color(0xffA0D0E7FF),
                  ),
                ),
              ),
              new Positioned(
                top: 0.0,
                bottom: 0.0,
                left: 35.0,
                child: new Container(
                  height: double.infinity,
                  width: 1.0,
                  color: Colors.black,
                ),
              ),
              new Positioned(
                top: 100.0,
                left: 15.0,
                child: new Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Container(
                    margin: new EdgeInsets.all(5.0),
                    height: 30.0,
                    width: 30.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff17edf1)),
                  ),
                ),
              )
            ],
          );
        },
        itemCount: 6,
      ),
    );
  }
}
