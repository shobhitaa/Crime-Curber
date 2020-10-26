import 'package:crime_curber/constants.dart';
import 'package:flutter/material.dart';
import 'package:crime_curber/welcome_bg.dart';
import 'package:crime_curber/terms.dart';
import 'package:crime_curber/privacy.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //provides total height and width of screen
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "CRIME ",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 32,
                color: const Color(0xba101010),
              ),
            ),
            Text(
              "CURBER",
              style: TextStyle(
                fontFamily: 'RedHatDisplay',
                fontSize: 46,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        SizedBox(height: size.height * 0.4),
        SizedBox(
          width: 250,
          height: 50,
          child: FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        SizedBox(height: size.height * 0.05),
        Text(
          "By continuing you indicate that you have",
          style: TextStyle(
            fontFamily: "OpenSans",
          ),
        ),
        Text(
          "read and agree to Crime Curber's",
          style: TextStyle(
            fontFamily: "OpenSans",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Terms();
                  }));
                },
                child: Text(
                  "Terms of Service",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold,
                      color: link_blue,
                      decoration: TextDecoration.underline),
                )),
            Text(
              " and ",
              style: TextStyle(
                fontFamily: "OpenSans",
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PrivacyPolicy();
                }));
              },
              child: Text(
              "Privacy Policy",
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  color: link_blue,
                  decoration: TextDecoration.underline),
            )),
            Text(".")
          ],
        )
      ],
    ));
  }
}
