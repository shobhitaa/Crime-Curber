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
                    fontFamily: 'OpenSans',
                    fontSize: 32,
                    color: const Color(0xba101010),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold)),
            Container(
              width: 250,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    customLaunch('tel:102');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  child: Text("Call")),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              width: 250,
              height: 60,
              child: ElevatedButton(
                  onPressed: () => MapsLauncher.launchQuery('Hospital'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  child: Text("Directions")),
            )
          ],
        ));
  }
}
