import "package:flutter/material.dart";
import 'package:crime_curber/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class PoliceBody extends StatefulWidget {
  @override
  _PoliceBodyState createState() => _PoliceBodyState();
}

class _PoliceBodyState extends State<PoliceBody> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFECECEC),
          image: DecorationImage(
            image: AssetImage("assets/images/welc_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.15),
            Text("Police",
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 47,
                    color: const Color(0xba101010),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.35),
            Container(
              width: 250,
              height: 80,
              child: ElevatedButton(
                  onPressed: () {
                    customLaunch('tel:100');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: blue_button,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call_rounded,
                        size: 32,
                      ),
                      SizedBox(width: size.width * 0.11),
                      Text("Place Call",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            ),
            SizedBox(height: size.height * 0.008),
            Text("Call Police Station",
                style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: dark_charcoal,
                    fontWeight: FontWeight.normal)),
            SizedBox(height: size.height * 0.03),
            Container(
              width: 250,
              height: 80,
              child: ElevatedButton(
                  onPressed: () => MapsLauncher.launchQuery('Police Station'),
                  style: ElevatedButton.styleFrom(
                      primary: blue_button,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(50.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 32,
                      ),
                      SizedBox(width: size.width * 0.11),
                      Text("Directions",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            ),
            SizedBox(height: size.height * 0.008),
            Text("Directions to the nearest Police Station",
                style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: dark_charcoal,
                    fontWeight: FontWeight.normal)),
          ],
        ));
  }
}