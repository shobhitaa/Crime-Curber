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

      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
          Text("CRIME ",
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 32,
          color: const Color(0xba101010),
        ),

      ),
      Text("CURBER",
        style: TextStyle(
          fontFamily: 'RedHatDisplay',
          fontSize: 46,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w700,
        ),
      )],
      ),
      SizedBox(height: size.height * 0.55),
        SizedBox(
          width: 250,
          height: 50,
          child: FlatButton(
            child: Row(
              children: [
                Image.asset(
                "assets/icons/google_icon.png",
                width: 30.0,
                height: 30.0,
              ),
                Text(
                  "Continue with Google",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            onPressed: () {},
            textColor: dark_charcoal,
            color: light_gray,
            shape: OutlineInputBorder(
                borderSide: BorderSide(
                    style: BorderStyle.solid, width: 0.4, color: dark_charcoal),
                borderRadius: new BorderRadius.circular(30.0)),
          ),
        ),
      ],
    )
    );
  }
}

