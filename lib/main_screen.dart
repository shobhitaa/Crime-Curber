import 'package:flutter/material.dart';
import 'package:crime_curber/constants.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: light_gray_bg,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "CRIME CURBER",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 32,
                      color: const Color(0xba101010),
                      decoration: TextDecoration.none),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 120,
                  width: 100,
                  child: Card(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[Text("Record")],
                      )),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 100,
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[Text("Hospital")],
                          )),
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[Text("SOS Timer")],
                          )),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 100,
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[Text("Police")],
                          )),
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[Text("Share Location")],
                          )),
                    )
                  ],
                )
              ],
            ),
            OutlineButton(
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(50)
              ),
              onPressed: null,
              child: Column(
                children: <Widget>[
                  Text("SOS"),
                ],
              ),
            )
          ],
        ));
  }
}
