import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
                    gradient: LinearGradient(colors:[Color(0xff96f47e), Color(0xff17edf1)])
                ),
                height: MediaQuery.of(context).size.height/2,
                child: Column(


                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "add you image URL here "
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 170,
                        child: Container(
                          alignment: Alignment(0.0,2.5),
                          child: CircleAvatar(
                            child: Icon(
                              Icons.account_circle_sharp,
                              size: 130,

                            ),
                            backgroundColor:Color(0xff1182d0),
                            radius: 65.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Name"
                      ,style: TextStyle(
                        fontSize: 25.0,
                        color:Colors.blueGrey,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "age:50"
                      ,style: TextStyle(
                        fontSize: 18.0,
                        color:Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Place"
                      ,style: TextStyle(
                        fontSize: 18.0,
                        color:Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Email || Phone Number"
                      ,style: TextStyle(
                        fontSize: 18.0,
                        color:Colors.black45,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),
                    ),
                  ]



                ),
              ),
              SizedBox(height: 70,),
              Column(
                children: [
                  Container(
                    width:300,
                    height: 70,
                    child: RaisedButton(

                    color: Color(0xff1182d0),
                      child: Text("Appointment",style: TextStyle(color: Colors.white,fontFamily: 'A'),),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width:300,
                    height: 70,
                    child: RaisedButton(

    color: Color(0xff1182d0),
                      child: Text("Report",style: TextStyle(color: Colors.white,fontFamily: 'A'),),
                      onPressed: () {},
                    ),
                  ),

                ],
              ),
            ],
          ),


        )

    );
  }
}
