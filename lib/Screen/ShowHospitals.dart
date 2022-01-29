import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class ShowHospitals extends StatefulWidget {
  @override
  _ShowHospitalsState createState() => _ShowHospitalsState();
}

class _ShowHospitalsState extends State<ShowHospitals> {
  bool loading=false;

  List<dynamic> Hospitals=<dynamic>[];
  List<dynamic> FilteredHospitals=<dynamic>[];

  Future<void> getDataFromApi() async {

    var url = "http://10.0.2.2:8000/hospitals";
    var res = await http.get(Uri.parse(url));
    var responsebody=json.decode(res.body);
    print(responsebody['data'][0]['name']);


    setState(() {
      Hospitals=responsebody['data'];
      FilteredHospitals=responsebody['data'];
      loading=false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading=true;
    });
    getDataFromApi();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("App-Name"),
        centerTitle: true,
        // leading: Icon(
        //   Icons.account_circle_rounded,
        // ),
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
          )
        ],
      ),
      body:loading?Container(height: MediaQuery.of(context).size.height,child: Center(child: CircularProgressIndicator(backgroundColor: Colors.cyan,),),):SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0.8)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              width: 0.8,
                              color: Theme.of(context).primaryColor)),
                      hintText: "Search..",
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.clear), onPressed: () {})),
                ),
              ),
              for(int i=0;i<FilteredHospitals.length;i++)
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(FilteredHospitals[i]['name']),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(FilteredHospitals[i]['address']),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10 ),
                                child: Icon(Icons.local_hospital),
                              ),
                            ],
                          ),
                         InkWell(
                             onTap: (){
                               launch("tel://${FilteredHospitals[i]['phone']}");
                             },
                             child: Padding(
                               padding: const EdgeInsets.only(left: 8.0),
                               child: Icon( Icons.call),
                             ))
                        ],
                      ),
                    ),
                  ),
                ),


              // Card(
              //   child: InkWell(
              //     splashColor: Colors.blue.withAlpha(30),
              //     onTap: () {
              //       debugPrint('Card tapped.');
              //     },
              //     child: const SizedBox(
              //       width: double.infinity,
              //       height: 125,
              //       child: Text('NEUROlLOGIST'),
              //     ),
              //   ),
              // ),
              // Card(
              //   child: InkWell(
              //     splashColor: Colors.blue.withAlpha(30),
              //     onTap: () {
              //       debugPrint('Card tapped.');
              //     },
              //     child: const SizedBox(
              //       width: double.infinity,
              //       height: 125,
              //       child: Text('PEDIATRICIANS'),
              //     ),
              //   ),
              // ),
              // Card(
              //   child: InkWell(
              //     splashColor: Colors.blue.withAlpha(30),
              //     onTap: () {
              //       debugPrint('Card tapped.');
              //     },
              //     child: const SizedBox(
              //       width: double.infinity,
              //       height: 125,
              //       child: Text('CARDIOLOGISTS'),
              //     ),
              //   ),
              // ),
              // Card(
              //   child: InkWell(
              //     splashColor: Colors.blue.withAlpha(30),
              //     onTap: () {
              //       debugPrint('Card tapped.');
              //     },
              //     child: const SizedBox(
              //       width: double.infinity,
              //       height: 125,
              //       child: Text('GYNECOLOGISTS'),
              //     ),
              //   ),
              // ),
              // Card(
              //   child: InkWell(
              //     splashColor: Colors.blue.withAlpha(30),
              //     onTap: () {
              //       debugPrint('Card tapped.');
              //     },
              //     child: const SizedBox(
              //       width: double.infinity,
              //       height: 125,
              //       child: Text('DENTISTS'),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
