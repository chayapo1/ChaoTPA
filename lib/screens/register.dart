import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String nameStr, emailStr, passwordStr;

  // Method
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Upload Clicked');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Name = $nameStr, Email = $emailStr, Password = $passwordStr');
        }
      },
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
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please fill Name.';
        }
      },
      onSaved: (String value) {
        nameStr = value;
      },
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
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please fill Email';
        } else if (!value.contains('@') || !value.contains('.')) {
          return 'Invalid Email';
        }
      },
      onSaved: (String value) {
        emailStr = value;
      },
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
      validator: (String value) {
        if (value.length < 7) {
          return 'Password failed.';
        }
      },
      onSaved: (String value) {
        passwordStr = value;
      },
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
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                nameText(),
                emailText(),
                passwordText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
