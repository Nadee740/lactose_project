import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 125,
                    child: Text('PSYCHIATRISTS'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 125,
                    child: Text('NEUROlLOGIST'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 125,
                    child: Text('PEDIATRICIANS'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 125,
                    child: Text('CARDIOLOGISTS'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 125,
                    child: Text('GYNECOLOGISTS'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    height: 125,
                    child: Text('DENTISTS'),
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
