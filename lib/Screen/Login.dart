import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lactose_project/Db/Urlclass.dart';
import 'package:lactose_project/Screen/Home.dart';
import 'package:lactose_project/Screen/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;
  final storage = new FlutterSecureStorage();
  Future<void> SubmitLogin() async {
    setState(() {
      isloading=true;
    });
    var res = await http.post(
      Uri.parse('${Urlclass.url}users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    var responsebody = json.decode(res.body);
     setState(() {
       isloading=false;
     });
    if (responsebody['status'].toString() == 'ok') {
      await storage.write(
          key: "jwtToken", value: responsebody['token'].toString());
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      }));
    }
else
  {
    showAlertDialog(context);
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'MedCo',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
                fontFamily: 'f'),
          ),
          centerTitle: true,
        ),
        body: isloading? Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.cyan,
            ),
          ),
        ): Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                // Container(
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.all(10),
                //     child: const Text(
                //       'Yoo',
                //       style: TextStyle(
                //           color: Colors.blue,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 30),
                //     )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'f',
                      ),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
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

                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    '',
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
                      'Login',
                      style: TextStyle(
                        fontFamily: 'f',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      SubmitLogin();
                    },
                  ),
                ),
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SignupPage();
                        }));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )));
  }
}
showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("PROCEED",style: TextStyle(fontFamily: 'f'),),
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
    title: Text("Invalid Login",style: TextStyle(fontFamily: 'f'),),
    content: Text("Invalid Input",style: TextStyle(fontFamily: 'f'),),
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
