import 'package:flutter/material.dart';
import 'package:crime_curber/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class HospitalBody extends StatefulWidget {
  @override
  _HospitalBodyState createState() => _HospitalBodyState();
}

class _HospitalBodyState extends State<HospitalBody> {
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
        color: light_gray_bg,
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.085),
            Text("Hospital",
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 47,
                    color: const Color(0xba101010),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold)),
            Text("Make a call to the police or",
                style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: card_gray,
                    fontWeight: FontWeight.normal)),
            Text("get directions to the nearest police station",
                style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: card_gray,
                    fontWeight: FontWeight.normal)),
            Container(
              width: 250,
              height: 100,
              child: ElevatedButton(
                  onPressed: () {
                    customLaunch('tel:102');
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
                      Text("Call",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              width: 250,
              height: 100,
              child: ElevatedButton(
                  onPressed: () => MapsLauncher.launchQuery('Hospital'),
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
                      Text("Directions",
                          style: TextStyle(
                              fontFamily: "SourceSansPro",
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
            )
          ],
        ));
  }
}
