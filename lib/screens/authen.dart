import 'package:chao_tpa/screens/myservice.dart';
import 'package:chao_tpa/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String emailStr, passwordStr;
  String msg = '';

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  // Method
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
        controller: user,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'your@email.com',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please fill Email';
            // } else if (!value.contains('@') || !value.contains('.')) {
            //   return 'Invalid Email';
          }
        },
        onSaved: (String value) {
          emailStr = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        controller: pass,
        obscureText: true,
        // validator: (val) => val.length < 6 ? 'Password too short.' : null,
        decoration: InputDecoration(
          labelText: 'Password :',
          hintText: 'More 6 characters',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please fill Password';
          }
        },
        onSaved: (String value) {
          passwordStr = value;
        },
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
      onPressed: () {
        // print('Sign In Clicked.');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          checkAuthen();
        }
      },
    );
  }

  Future<List> checkAuthen() async {
    var url = 'http://www.tpa.or.th/e-service/flutter/get.php';
    http.Response response = await http.post(url, body: {
      "username": user.text,
      "password": pass.text,
    });
    var datauser = json.decode(response.body);
    print(datauser.toString());
    if (datauser.length == 0) {
      setState(() {
        msg = "Login failed";
        showError(msg);
      });
    } else {
      moveToService();
    }
  }

  Widget showError(String msg) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    msg,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
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
        child: Form(
          key: formKey,
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
      ),
    );
  }
}
