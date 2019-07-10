import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit

  // Method
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name :',
        labelStyle: TextStyle(
          color: Colors.blue[700],
          fontSize: 24.0,
          fontFamily: 'Pacifico',
        ),
        helperText: 'Full Name',
        helperStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(
          Icons.perm_identity,
          size: 36.0,
          color: Colors.blue[700],
        ),
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email :',
        labelStyle: TextStyle(
          color: Colors.blue[700],
          fontSize: 24.0,
          fontFamily: 'Pacifico',
        ),
        helperText: 'your@email.com',
        helperStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(
          Icons.alternate_email,
          size: 36.0,
          color: Colors.blue[700],
        ),
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password :',
        labelStyle: TextStyle(
          color: Colors.blue[700],
          fontSize: 24.0,
          fontFamily: 'Pacifico',
        ),
        helperText: 'More than 6 characters',
        helperStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(
          Icons.vpn_key,
          size: 36.0,
          color: Colors.blue[700],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, // Allow keyboard over the widget
      appBar: AppBar(
        actions: <Widget>[
          uploadButton(),
        ],
        backgroundColor: Colors.cyan[600],
        title: Text('Register'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30.0),
        child: Container(
            width: 300.0,
            child: Column(
              children: <Widget>[
                nameText(),
                emailText(),
                passwordText(),
              ],
            )),
      ),
    );
  }
}
