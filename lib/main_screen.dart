import 'package:flutter/material.dart';
import 'package:crime_curber/constants.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool _hasBeenPressed = false;
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
                  height: 200,
                  width: 120,
                  child: Card(
                      color: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset("assets/images/dslr-camera.png",
                          width: 70,
                          height: 70),
                          Text("Record",
                          style: TextStyle(
                            color: dark_charcoal,
                            fontFamily: "OpenSans",
                            fontSize: 17
                          ))],
                      )),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 110,
                      child: Card(
                          color: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[Image.asset("assets/images/hospital.png",
                            width: 40,
                            height: 40),
                              Text("Hospital",
                                  style: TextStyle(
                                      color: dark_charcoal,
                                      fontFamily: "OpenSans",
                                      fontSize: 14
                                  ))],
                          )),
                    ),
                    Container(
                      height: 100,
                      width: 110,
                      child: Card(
                          color: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[Image.asset("assets/images/sostimer.png",
                                width: 40,
                                height: 40),
                              Text("SOS Timer",
                                  style: TextStyle(
                                      color: dark_charcoal,
                                      fontFamily: "OpenSans",
                                      fontSize: 14
                                  ))],
                          )),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 110,
                      child: Card(
                          color: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[Image.asset("assets/images/police.png",
                                width: 40,
                                height: 40),
                              Text("Police",
                                  style: TextStyle(
                                      color: dark_charcoal,
                                      fontFamily: "OpenSans",
                                      fontSize: 14
                                  ))],
                          )),
                    ),
                    Container(
                      height: 100,
                      width: 110,
                      child: Card(
                          color: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[Image.asset("assets/images/location.png",
                                width: 40,
                                height: 40),
                              Text("Share Location",
                                  style: TextStyle(
                                      color: dark_charcoal,
                                      fontFamily: "OpenSans",
                                      fontSize: 14
                                  ))],
                          )),
                    )
                  ],
                )
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  primary: _hasBeenPressed ? Colors.red : Colors.blueGrey,
                  elevation: 7
              ),
              onPressed: () {
                setState(() {
                  _hasBeenPressed = !_hasBeenPressed;
                });
              },
              child: Container(
                width: 200,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Text(
                  'SOS',
                  style: TextStyle(fontSize: 44),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                          elevation: 7
                      ),
                      onPressed: () {},
                      child: Container(
                          width: 63,
                          height: 63,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: //Image.asset("assets/images/add-contact.png")
                          Text("C",
                            style: TextStyle(
                                color: Colors.black
                            ),)
                      ),
                    ),
                    Text("Emergency",
                        style: TextStyle(
                            color: dark_charcoal,
                            fontFamily: "OpenSans",
                            fontSize: 12,
                            decoration: TextDecoration.none
                        )
                    ),
                    Text("Contacts",
                        style: TextStyle(
                            color: dark_charcoal,
                            fontFamily: "OpenSans",
                            fontSize: 12,
                            decoration: TextDecoration.none
                        )
                    )
                  ],
                ),
                Column( children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.white,
                        elevation: 7
                    ),
                    onPressed: () {},
                    child: Container(
                        width: 63,
                        height: 63,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/icons/upload.png",
                            width: 41,
                            height: 41
                        )
                    ),
                  ),
                  Text("Upload",
                      style: TextStyle(
                          color: dark_charcoal,
                          fontFamily: "OpenSans",
                          fontSize: 12,
                          decoration: TextDecoration.none
                      ))
                ]
                ),
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                          elevation: 7
                      ),
                      onPressed: () {},
                      child: Container(
                          width: 63,
                          height: 63,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset("assets/icons/help.png",
                              width: 40,
                              height: 40)
                      ),
                    ),
                    Text(
                      "Help",
                      style: TextStyle(
                          color: dark_charcoal,
                          fontFamily: "OpenSans",
                          fontSize: 12,
                          decoration: TextDecoration.none
                    ))
                  ],
                )


              ],
            )
          ],
        ));
  }
}
