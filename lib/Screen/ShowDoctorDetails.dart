  import 'package:flutter/material.dart';

class ShowDoctorDetails extends StatefulWidget {
  const ShowDoctorDetails({Key? key}) : super(key: key);

  @override
  _ShowDoctorDetailsState createState() => _ShowDoctorDetailsState();
}

class _ShowDoctorDetailsState extends State<ShowDoctorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: []),
      ),
    );
  }
}
