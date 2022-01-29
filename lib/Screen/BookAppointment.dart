import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_range/time_range.dart';
import 'package:alert_dialog/alert_dialog.dart';
class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key}) : super(key: key);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 1250,
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      child: CircleAvatar(
                        child: Icon(
                          Icons.account_circle_sharp,
                          size: 130,
                        ),
                        backgroundColor: Color(0xff0d1113),
                        radius: 65.0,
                      ),
                    ),
                    Text("Dr.XXXXX",style:TextStyle(color: Colors.black,fontSize: 40,),),
                    Text("Dentist, Hospital",style:TextStyle(color: Colors.black,fontSize: 25,),),
                    Padding(padding: const EdgeInsets.only(top: 15),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Center(child: Text("Patients:500+",style: TextStyle(color:Colors.black,fontFamily: 'A'),)),
                          color: Color(0xff4fe5a8),
                          height: 20,
                          width: MediaQuery.of(context).size.width/3.5,
                        ),
                        Container(
                          child: Center(child: Text("Experience:10 Yrs+",style: TextStyle(color:Colors.black,fontFamily: 'A'),)),
                          color: Color(0xff4fe5a8),
                          height: 20,
                          width: MediaQuery.of(context).size.width/3.3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.orange,
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 20),),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("About Doctor",style: TextStyle(fontSize: 25),),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 20),),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(" and more recently withthe release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem ",style: TextStyle(fontSize: 10),),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: Column(
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 20),),
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Book Slot",style: TextStyle(fontSize: 25),),
                        ),
                      ),
                      Container(
                        child: TableCalendar(
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: DateTime.now(),
                          selectedDayPredicate: (day) {
                            print(day);
                            return true;
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                            });
                          },
                        ),

                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(padding: const EdgeInsets.only(top: 20),),
                            Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Time",style: TextStyle(fontSize: 25),),
                              ),
                            ),
                            TimeRange(
                              fromTitle: Text('From', style: TextStyle(fontSize: 18, color: Colors.grey),),
                              toTitle: Text('To', style: TextStyle(fontSize: 18, color: Colors.grey),),
                              titlePadding: 20,
                              textStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black87),
                              activeTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              borderColor: Colors.black,
                              backgroundColor: Colors.transparent,
                              activeBackgroundColor: Colors.orange,
                              firstTime: TimeOfDay(hour: 9, minute: 30),
                              lastTime: TimeOfDay(hour: 16, minute: 00),
                              timeStep: 30,
                              timeBlock: 30,
                              onRangeCompleted: (range) => setState(() => print(range)),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(top: 50),),
                      Container(
                        width:300,
                        height: 50,
                        child: RaisedButton(
                          color:Color(0xff1d3d7d),
                          child: Text("Book Appointment",style: TextStyle(color: Colors.white,fontFamily: 'A'),),
                          onPressed: () {
                            showAlertDialog(context);
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

    );
  }
}
showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("PROCEED"),
    onPressed: () {
      Navigator.pushReplacement(context, PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation, Animation<double> secAnimation,
              Widget child) {
            return ScaleTransition(scale: animation,
              alignment: Alignment.center,
              child: child,);
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return BookAppointment();
          }));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Appointment Confirmed!"),
    content: Text("Booking ID:435\nDoctor:Name\nDate : Time"),
    actions: [
      cancelButton,

    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async{return true;
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (BuildContext context) {
            //   return Home();
            // }));
          },
          child: alert);
    },
  );
}
