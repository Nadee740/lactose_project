import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
class ShowAmbulance extends StatefulWidget {
  const ShowAmbulance({Key? key}) : super(key: key);

  @override
  _ShowAmbulanceState createState() => _ShowAmbulanceState();
}

class _ShowAmbulanceState extends State<ShowAmbulance> {
  bool loading=false;

  List<dynamic> Ambulance=<dynamic>[];
  List<dynamic> FilteredAmbulance=<dynamic>[];

  Future<void> getDataFromApi() async {

    var url = "http://10.0.2.2:8000/ambulance";
    var res = await http.get(Uri.parse(url));
    var responsebody=json.decode(res.body);



    setState(() {
      Ambulance=responsebody['data'];
      FilteredAmbulance=responsebody['data'];

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
      body: SingleChildScrollView(
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
              for(int i=0;i<FilteredAmbulance.length;i++)
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
                          child: Text(FilteredAmbulance[i]['name']),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(FilteredAmbulance[i]['place']),
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
                              launch("tel://+91${FilteredAmbulance[i]['phone']}");
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



            ],
          ),
        ),
      ),
    );
  }
}
