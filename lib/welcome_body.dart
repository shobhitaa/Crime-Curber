import 'package:crime_curber/constants.dart';
import 'package:flutter/material.dart';
import 'package:crime_curber/welcome_bg.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //provides total height and width of screen
    Size size = MediaQuery.of(context).size;
    return Background(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Text("CRIME CURBER",
      style: TextStyle(fontWeight: FontWeight.bold),
      ),
      FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: kPrimaryColor,
          onPressed: () {}, child: Text("Sign in with Google"),
          textColor: Colors.white,
      )
      ],
    )
    );
  }
}

