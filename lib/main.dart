import 'package:flutter/material.dart';
import 'package:lactose_project/Screen/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xff17edf1),
        ),
      ),
      home: Home(),
    );
  }
}
