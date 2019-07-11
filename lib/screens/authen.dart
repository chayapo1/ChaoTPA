import 'dart:math';

import 'package:chao_tpa/screens/myservice.dart';
import 'package:chao_tpa/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit

  // Method
  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      moveToService();
    }
  }

  void moveToService() {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

  Widget showLogo() {
    return Container(
      width: 150.0,
      // height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showText() {
    return Text(
      'Chao TPA',
      style: TextStyle(
          fontSize: 30.0,
          color: Colors.brown[800],
          fontWeight: FontWeight.bold,
          fontFamily: 'Pacifico'),
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'your@email.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        // validator: (val) => val.length < 6 ? 'Password too short.' : null,
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More than 6 characters',
        ),
      ),
    );
  }

  Widget signinButton() {
    return RaisedButton(
      color: Colors.green[400],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {},
    );
  }

  Widget signupButton() {
    return RaisedButton(
      color: Colors.yellow[600],
      child: Text('Sign Up'),
      onPressed: () {
        print('Sign Up Clicked.');

        // Create route
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showButton() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: signinButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signupButton(),
          ),
        ],
      ),
      width: 250.0,
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 10.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, // Allow keyboard over the widget
      body: Container(
        // color: Colors.orange[100],
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.cyan[300]],
            radius: 1.0,
            center: Alignment.topCenter,
          ),
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            showLogo(),
            showText(),
            emailText(),
            passwordText(),
            showButton(),
          ],
        ),
      ),
    );
  }
}

// Test staged changes
