import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameStr = "";

  // Method
  @override
  void initState() {
    super.initState();
  }

  Future<void> doSignOutAndExit() async {
    await firebaseAuth.signOut().then((response) {
      exit(0);
    });
  }

  Widget showAppName() {
    return Text(
      'Chao TPA',
      style: TextStyle(
        fontSize: 24,
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      // height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange[300],
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  showLogo(),
                  showAppName(),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              size: 36,
              color: Colors.red,
            ),
            title: Text(
              'Sign out',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            onTap: () {
              doSignOutAndExit();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
      ),
      body: Text('body'),
      drawer: myDrawerMenu(),
    );
  }
}
