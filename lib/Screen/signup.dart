import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lactose_project/Screen/Home.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List<dynamic> Signupresult=<dynamic>[];
 bool isloading=false;
  Future<void> SubmitSignup() async {
     print("hy");
     var res=await http.post(
      Uri.parse('http://10.0.2.2:8000/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name':nameController.text,
        'email':emailController.text,
        'password':passwordController.text,
        'age':ageController.text,
        'phone':phoneController.text,
        'gender':genderController.text,
        'place':placeController.text
      }),
    );

     var responsebody=json.decode(res.body);
     print("hyyy");
     print(responsebody['status']);
     if(responsebody['status'].toString()=='failed')
       { Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (BuildContext context) {
             return Home();
           }));

       }
     // print(responsebody['data'][0]['name']);


    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'App-Name',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
                fontFamily: 'f'),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                // Container(
                //   alignment: Alignment.center,
                //   padding: const EdgeInsets.all(10),
                //   child: const Text(
                //     'App-Name',
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 30,
                //         fontFamily: 'f'),
                //   ),
                // ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'f',
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(

                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(

                    controller: ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Age',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(

                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: genderController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(

                    controller: placeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Place',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Already registered',
                    style: TextStyle(
                      fontFamily: 'f',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'f',
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        print('hy');
                        SubmitSignup();
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'f',
                        ),
                      ),
                      onPressed: () {
                        SubmitSignup();
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )));
  }
}