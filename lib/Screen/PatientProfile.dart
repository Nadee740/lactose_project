import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lactose_project/Db/Urlclass.dart';
import 'package:lactose_project/Screen/CurrAppointment.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/Login.dart';
import 'package:lactose_project/Screen/TestReport.dart';
import 'package:image_picker/image_picker.dart';
class PatientProfile extends StatefulWidget {
  const PatientProfile({Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  final ImagePicker _picker = ImagePicker();
  PickedFile image4=PickedFile("");
  XFile? image;

  void selectimage(XFile? pickIMage)async{
    XFile? tempimage=await pickIMage;
    setState(() {
      image=tempimage;
    });

  }
  Widget displayimage(){
    if(image==null){
      return Padding(
        padding: EdgeInsets.fromLTRB(8, 30, 8, 30),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,40,8,40),
          child: Icon(Icons.add,color: Colors.grey,),
        ),
      );
    }
    else{
      return Padding(padding: EdgeInsets.fromLTRB(8, 30, 8, 30),
        child: Image.file(File(image!.path),fit: BoxFit.fill,width: double.infinity,),
      );

    }
  }
  bool loading = false;

  late Map<String, dynamic> Data;

  Future<void> getDataFromApi() async {
    final storage = new FlutterSecureStorage();

    var url = "${Urlclass.url}users/me";
    var token = await storage.read(key: "jwtToken");

    var res = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${token}'
      },
    );
    // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MWY0ZmY0NmI2ZGZmZDZiMmMzNmFiNGUiLCJpYXQiOjE2NDM0NDYwODZ9.ETka6u8ShfXmpMNW7dTX_dHsCzeRYhJ8d2yeYXey1u0
    var responsebody = json.decode(res.body);

    print(responsebody['data'].runtimeType);
    setState(() {
      Data = responsebody['data'];

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
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff96f47e), Color(0xff17edf1)])),
              height: MediaQuery.of(context).size.height / 1.6,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                            NetworkImage("add you image URL here "),
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
                              child:
                              image!=null? CircleAvatar(
                                backgroundImage: FileImage(File(image!.path)),
                                backgroundColor: Color(0xff1182d0),
                                radius: 65.0,) :CircleAvatar(
                                child:Icon(Icons.account_circle,size: 120,),radius: 60,)
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonTheme(
                    child: FlatButton(
                      child: Icon(Icons.add_a_photo),
                      onPressed: ()async{
                        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                        selectimage(image);

                      },
                    ),
                  ),
                  Text(
                    Data['name'],
                    style: TextStyle(
                      fontSize: 35.0,
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
                    "age:${Data['age']}",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'f',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    Data['place'],
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'f',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${Data['phone']} || ${Data['email']}",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'f',
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  RaisedButton(
                      child: Text("Logout",style: TextStyle(fontFamily: 'f',color: Colors.black),),
                      color: Color(0xff00f6fa),
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return LoginPage();
                            },
                          ),
                        );
                      }
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  height: 70,
                  child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Color(0xff17edf1),
                    icon: Icon(Icons.badge),
                    label: Text(
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
                  child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Color(0xff17edf1),
                    icon: Icon(Icons.assignment),
                    label: Text(
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
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}