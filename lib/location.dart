import 'package:flutter/material.dart';
import 'package:crime_curber/constants.dart';

class ShareLocation extends StatefulWidget {
  @override
  _ShareLocationState createState() => _ShareLocationState();
}

class _ShareLocationState extends State<ShareLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: light_gray_bg,
        child: Column(
          children: <Widget>[
            Text("Share Location",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 32,
                    color: const Color(0xba101010),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold)),
            Text("")
          ],
        ));
  }
}
