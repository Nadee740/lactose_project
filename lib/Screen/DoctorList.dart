import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('App-Name'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Appointment'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Test Report'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Hospitals'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Lab'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Ambulance'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Send Feedback'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
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
                      hintText: "Search By Hospitals",
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.clear), onPressed: () {})),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
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
                    RatingBar.builder(
                      itemSize: 25,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 125,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(child: Text('DR.MOKNER WAND')),
                            Text("DENTISTS"),
                            Text("Hospital"),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color(0xff1d3d7d),
                                child: Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'A'),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
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
                    RatingBar.builder(
                      itemSize: 25,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 125,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(child: Text('DR.MOKNER WAND')),
                            Text("DENTISTS"),
                            Text("Hospital"),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color(0xff17edf1),
                                child: Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'A'),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
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
                    RatingBar.builder(
                      itemSize: 25,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 125,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(child: Text('DR.MOKNER WAND')),
                            Text("DENTISTS"),
                            Text("Hospital"),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color(0xff1d3d7d),
                                child: Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'A'),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
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
                    RatingBar.builder(
                      itemSize: 25,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 125,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(child: Text('DR.MOKNER WAND')),
                            Text("DENTISTS"),
                            Text("Hospital"),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color(0xff1d3d7d),
                                child: Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'A'),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
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
                    RatingBar.builder(
                      itemSize: 25,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 125,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(child: Text('DR.MOKNER WAND')),
                            Text("DENTISTS"),
                            Text("Hospital"),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color(0xff1d3d7d),
                                child: Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'A'),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Container(
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
                    RatingBar.builder(
                      itemSize: 25,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        debugPrint('Card tapped.');
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 125,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Center(child: Text('DR.MOKNER WAND')),
                            Text("DENTISTS"),
                            Text("Hospital"),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 50,
                              width: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Color(0xff1d3d7d),
                                child: Text(
                                  "Book Appointment",
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'A'),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
