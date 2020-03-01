import 'package:air4ung/utility/my_style.dart';
import 'package:air4ung/utility/normal_dialog.dart';
import 'package:air4ung/widget/my_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field
  String name, email, password;

  // Method
  Widget nameForm() {
    Color color = Colors.purple[600];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(
            onChanged: (String string) {
              name = string.trim();
            },
            decoration: InputDecoration(
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: color)),
              helperStyle: TextStyle(color: color),
              labelStyle: TextStyle(color: color),
              icon: Icon(
                Icons.supervised_user_circle,
                size: 36.0,
                color: color,
              ),
              helperText: 'Type Your Name in the Blank',
              labelText: 'Display Name :',
            ),
          ),
        ),
      ],
    );
  }

  Widget emailForm() {
    Color color = Colors.green[700];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(
            onChanged: (String string) {
              email = string.trim();
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: color)),
              helperStyle: TextStyle(color: color),
              labelStyle: TextStyle(color: color),
              icon: Icon(
                Icons.email,
                size: 36.0,
                color: color,
              ),
              helperText: 'Type Your Email in the Blank',
              labelText: 'Email :',
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordForm() {
    Color color = Colors.pink[600];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(
            onChanged: (String string) {
              password = string.trim();
            },
            decoration: InputDecoration(
              enabledBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: color)),
              helperStyle: TextStyle(color: color),
              labelStyle: TextStyle(color: color),
              icon: Icon(
                Icons.lock_open,
                size: 36.0,
                color: color,
              ),
              helperText: 'Type Your Password in the Blank',
              labelText: 'Password :',
            ),
          ),
        ),
      ],
    );
  }

  Widget registerButton() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: 250.0,
      child: OutlineButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        borderSide: BorderSide(color: MyStyle().darkColor),
        child: Text(
          'Register',
          style: TextStyle(color: MyStyle().darkColor),
        ),
        onPressed: () {
          print('name = $name, email = $email, password = $password');

          if (name == null ||
              name.isEmpty ||
              email == null ||
              email.isEmpty ||
              password == null ||
              password.isEmpty) {
            normalDialog(context, 'Have Space', 'Please Fill Every Blank');
          } else {
            registerThread();
          }
        },
      ),
    );
  }

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((response) {
      print('Register Success');
      setupDisplayName();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      normalDialog(context, title, message);
    });
  }

  Future<void> setupDisplayName() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    firebaseUser.updateProfile(userUpdateInfo);

    MaterialPageRoute route =
        MaterialPageRoute(builder: (BuildContext buildContext) {
      return MyService();
    });
    Navigator.of(context).pushAndRemoveUntil(route, (Route<dynamic> route) {
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: MyStyle().darkColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              nameForm(),
              emailForm(),
              passwordForm(),
              registerButton(),
            ],
          ),
        ),
      ),
    );
  }
}
