import 'package:air4ung/utility/my_style.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field

  // Method
  Widget nameForm() {
    Color color = Colors.purple[600];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 250.0,
          child: TextField(
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        borderSide: BorderSide(color: MyStyle().darkColor),
        child: Text('Register', style: TextStyle(color: MyStyle().darkColor),),
        onPressed: () {},
      ),
    );
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
