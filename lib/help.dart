import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:crime_curber/terms.dart';

class HelpBody extends StatefulWidget {
  @override
  _HelpBodyState createState() => _HelpBodyState();
}

class _HelpBodyState extends State<HelpBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: light_gray_bg,
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.085),
            Container(
              width: 250,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Terms();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                  child: Text("Terms of service")),
            )
          ],
        ));
  }
}
