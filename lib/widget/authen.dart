import 'package:air4ung/utility/my_style.dart';
import 'package:air4ung/widget/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field

  // Method
  Widget loginButton() {
    return Container(
      width: 250.0,
      child: RaisedButton(
        color: MyStyle().darkColor,
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget newRegisterButton() {
    return FlatButton(
      child: Text(
        'New Register',
        style: TextStyle(
          color: MyStyle().darkColor,
          fontStyle: FontStyle.italic,
        ),
      ),
      onPressed: () {
        print('You Click Register');

        MaterialPageRoute route =
            MaterialPageRoute(builder: (BuildContext context) {
          return Register();
        });
        Navigator.of(context).push(route);
      },
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkColor)),
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'User :',
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: MyStyle().darkColor)),
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'Password :',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Air4Ung',
      style: GoogleFonts.pacifico(
          textStyle: TextStyle(
        color: MyStyle().darkColor,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().primaryColor],
            radius: 1.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              userForm(),
              passwordForm(),
              loginButton(),
              newRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
