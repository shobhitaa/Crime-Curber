import 'package:crime_curber/Contacts/addContacts.dart';
import 'package:crime_curber/Login/login.dart';
import 'package:crime_curber/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCheck extends StatelessWidget {
  Future getCurrentUser(BuildContext context) async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    FirebaseUser myUser = _user;
    if (myUser != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainView(user: myUser),
          ));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
    return _user;
  }

  @override
  Widget build(BuildContext context) {
    getCurrentUser(context);
    return Container();
  }
}
