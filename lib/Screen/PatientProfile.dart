import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/TestReport.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                        image: NetworkImage("add you image URL here "),
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
                height: 60,
              ),
              Text(
                "Name",
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
                "age:50",
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
                "Place",
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
                "Email || Phone Number",
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
                  onPressed: () {
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
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
