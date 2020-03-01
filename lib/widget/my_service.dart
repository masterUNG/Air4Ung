import 'package:air4ung/utility/my_style.dart';
import 'package:air4ung/widget/authen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Field

  // Method
  Widget signOutButton() {
    return IconButton(
      tooltip: 'SignOut',
      icon: Icon(Icons.exit_to_app),
      onPressed: () {
        signOutProcess();
      },
    );
  }

  Future<void> signOutProcess() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut().then((response) {

      MaterialPageRoute route = MaterialPageRoute(builder: (context) => Authen());
      Navigator.of(context).pushAndRemoveUntil(route, (route) => false);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        actions: <Widget>[signOutButton()],
        title: Text('Air4Ung'),
      ),
    );
  }
}
