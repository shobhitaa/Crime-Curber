import 'package:flutter/material.dart';
import 'package:crime_curber/constants.dart';
import 'package:crime_curber/police.dart';
import 'package:crime_curber/hospital.dart';
import 'package:crime_curber/help.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  //bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
        color: light_gray_bg,
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.085),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: size.width * 0.1),
                Text(
                  "CRIME CURBER",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 32,
                      color: const Color(0xba101010),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Sign Out"))
              ],
            ),
            SizedBox(height: size.height * 0.066),
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
                            color: card_gray,
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
                      child: GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return HospitalBody();
                        }));},
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
                                        color: card_gray,
                                        fontFamily: "OpenSans",
                                        fontSize: 13
                                    ))],
                            )),
                      ),
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
                                      color: card_gray,
                                      fontFamily: "OpenSans",
                                      fontSize: 13
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
                      child: GestureDetector(
                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return PoliceBody();
                        }));
                        },
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
                                        color: card_gray,
                                        fontFamily: "OpenSans",
                                        fontSize: 13
                                    ))],
                            )),
                      ),
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
                              Column(
                                children: [
                                  Text("Location",
                                  style: TextStyle(
                                      color: card_gray,
                                      fontFamily: "OpenSans",
                                      fontSize: 13
                                  ))],
                              )
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: size.height * 0.1),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  //primary: _hasBeenPressed ? Colors.red : Colors.blueGrey,
                  elevation: 7
              ),
              onPressed: () {
                //setState(() {
                  //_hasBeenPressed = !_hasBeenPressed;
                //});
              },
              child: Container(
                width: 185,
                height: 185,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle,
                gradient: new LinearGradient(
                  colors: [
                    Color(0xFF727272),
                    Color(0xFF3D3D3D),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,)),
                child: Text(
                  'SOS',
                  style: TextStyle(fontSize: 44),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.085),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Image.asset("assets/icons/contacts.png",
                          width: 50,
                          height: 50)
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    //SizedBox(width: size.width * 0.35),
                    Text("Add Contacts",
                        style: TextStyle(
                            color: icon_gray,
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
                  SizedBox(height: size.height * 0.01),
                  Text("Upload",
                      style: TextStyle(
                          color: icon_gray,
                          fontFamily: "OpenSans",
                          fontSize: 12,
                          decoration: TextDecoration.none
                      ))
                ]
                ),
                //SizedBox(width: size.width * 0.03),
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.white,
                          elevation: 7
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HelpBody();
                      }));},
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
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Help",
                      style: TextStyle(
                          color: icon_gray,
                          fontFamily: "OpenSans",
                          fontSize: 12,
                          decoration: TextDecoration.none,
                    ))
                  ],
                )
              ],
            )
          ],
        ));
  }
}
