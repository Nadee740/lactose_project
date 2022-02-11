import 'dart:convert';
// MedCo
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_range/time_range.dart';
import 'package:alert_dialog/alert_dialog.dart';
import 'package:http/http.dart' as http;

class BookAppointment extends StatefulWidget {
  const BookAppointment({Key? key, required this.docid}) : super(key: key);
  final String docid;
  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  bool loading = false;
  List<dynamic> Doctors = <dynamic>[];
  List<dynamic> FilteredDoctors = <dynamic>[];
  Map UserData = Map<String, dynamic>();
  Map Doctordata = Map<String, dynamic>();
  String date = "";
  String time = "";

  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 14, minute: 50),
    TimeOfDay(hour: 15, minute: 20),
  );
  Future<void> SubmitAppointmnet() async {
    var url = "https://lactose-backend.herokuapp.com/create-appointment";
    var res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "patientid": UserData['_id'],
        "date": date,
        "doctorId": widget.docid,
        "hospitalid": Doctordata['hospital_id'],
        "desc": "create cheyd pooi adhaata"
      }),
    );
    var responsebody = json.decode(res.body);
    print(responsebody);
    if (responsebody['status'] == "ok") {
      showAlertDialog(context, Doctordata['name'], date);
    }
  }

  Future<void> getDataFromApi() async {
    var url = "https://lactose-backend.herokuapp.com/doctor/${widget.docid}";
    var res = await http.get(Uri.parse(url));
    var responsebody = json.decode(res.body);
    print(responsebody);

    final storage = new FlutterSecureStorage();

    var url1 = "https://lactose-backend.herokuapp.com/users/me";
    var token = await storage.read(key: "jwtToken");

    var response = await http.get(
      Uri.parse(url1),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}'
      },
    );

    // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWY0ZmY0NmI2ZGZmZDZiMmMzNmFiNGUiLCJpYXQiOjE2NDM0NDYwODZ9.ETka6u8ShfXmpMNW7dTX_dHsCzeRYhJ8d2yeYXey1u0
    var responsebodyuser = json.decode(response.body);

    setState(() {
      Doctordata = responsebody['data'];
      UserData = responsebodyuser['data'];
      loading = false;
    });
  }

  TimeRangeResult? _timeRange;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timeRange = _defaultTimeRange;
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
                          Text(
                            Doctordata['name'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontFamily: 'f',
                            ),
                          ),
                          Text(
                            "${Doctordata['specification']} ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'f',
                              letterSpacing: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    Doctordata['qualification'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'f',
                                    ),
                                  ),
                                ),
                                color: Color(0xff4fe5a8),
                                height: 20,
                                width: MediaQuery.of(context).size.width / 3.1,
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    "Experience:${Doctordata['exprnc']} Yrs+",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'f',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                color: Color(0xff4fe5a8),
                                height: 20,
                                width: MediaQuery.of(context).size.width / 3.1,
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
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "About Doctor:",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'f',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              Doctordata['qualification'] + " me d pwolieeeyyy",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'f',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.lightBlueAccent,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                            ),
                            Container(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Book Slot:",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'f',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Container(
                              child: TableCalendar(
                                firstDay: DateTime.utc(2010, 10, 16),
                                lastDay: DateTime.utc(2030, 3, 14),
                                focusedDay: DateTime.now(),
                                selectedDayPredicate: (day) {
                                  return true;
                                },
                                onDaySelected: (selectedDay, focusedDay) {
                                  setState(
                                    () {
                                      date = selectedDay.day.toString() +
                                          "-" +
                                          selectedDay.month.toString() +
                                          "-" +
                                          selectedDay.year.toString();
                                    },
                                  );
                                },
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                  ),
                                  Container(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Time:",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'f',
                                        ),
                                      ),
                                    ),
                                  ),
                                  TimeRange(
                                    fromTitle: Text(
                                      'From',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'f',
                                      ),
                                    ),
                                    toTitle: Text(
                                      'To',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'f',
                                      ),
                                    ),
                                    titlePadding: 20,
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87),
                                    activeTextStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    borderColor: Colors.black,
                                    backgroundColor: Colors.transparent,
                                    activeBackgroundColor: Colors.orange,
                                    firstTime: TimeOfDay(hour: 9, minute: 30),
                                    lastTime: TimeOfDay(hour: 16, minute: 00),
                                    timeStep: 30,
                                    timeBlock: 30,
                                    onRangeCompleted: (range) =>
                                        setState(() => _timeRange = range),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color(0xff17edf1),
                                child: Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'f',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {
                                  SubmitAppointmnet();
                                  // showAlertDialog(context);
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

showAlertDialog(BuildContext context, String name, String date) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("PROCEED"),
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
    title: Text("Appointment Confirmed!"),
    content: Text("Doctor:${name}\nDate : ${date}"),
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
