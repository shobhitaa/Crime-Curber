import 'package:flutter/material.dart';
import 'package:hypertrack_plugin/hypertrack.dart';
import 'package:crime_curber/shareLiveLocation/networking.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:crime_curber/constants.dart';

const String publishableKey =
    'e4op1fBe_lQ7GakFcPOJ3mH82yGAzuG3uOAq8L0yKIlLMdfR4EIzT-L9Cyb09rPWpL5ef-lph9lTrdiDg1hZZA';
// void main() => runApp(HyperTrackQuickStart());

class HyperTrackQuickStart extends StatefulWidget {
  HyperTrackQuickStart({Key key}) : super(key: key);

  @override
  _HyperTrackQuickStartState createState() => _HyperTrackQuickStartState();
}

class _HyperTrackQuickStartState extends State<HyperTrackQuickStart> {
  HyperTrack sdk;
  String deviceId;
  NetworkHelper helper;
  String result = '';
  bool isLink = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initializeSdk();
  }

  Future<void> initializeSdk() async {
    sdk = await HyperTrack.initialize(publishableKey);
    deviceId = await sdk.getDeviceId();
    sdk.setDeviceName('Deep');
    helper = NetworkHelper(
      url: 'https://v3.api.hypertrack.com',
      auth:
          'Basic Y3NuMk95SnFjNzYtYV9KOEQxcHNYX2JWM1E4OkNxUDRzUHlfOTYzREZoWFdEaGY5dDJwMUdoYTRHV3hGLWFJUzhzUEduNmtGVmh3SHQ3TWlJUQ==',
      id: deviceId,
    );
    print(deviceId);
  }

  void shareLink() async {
    setState(() {
      isLoading = true;
      result = '';
    });
    var data = await helper.getData();
    setState(() {
      result = data['views']['share_url'];
      isLink = true;
      isLoading = false;
    });
  }

  void startTracking() async {
    setState(() {
      isLoading = true;
      result = '';
    });
    var startTrack = await helper.startTracing();
    setState(() {
      result = (startTrack['message']);
      isLink = false;
      isLoading = false;
    });
  }

  void endTracking() async {
    setState(() {
      isLoading = true;
      result = '';
    });
    var endTrack = await helper.endTracing();
    setState(() {
      result = (endTrack['message']);
      isLink = false;
      isLoading = false;
    });
  }

  void lunchUrl() async {
    await launch(result);
  }

  bool hasBeenPressed = false;
  void _button_state(bool B) {
    setState(() => hasBeenPressed = B);
  }
  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;
      return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/welc_bg.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.05),
            Text("Share Location",
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 47,
                    color: const Color(0xba101010),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.073),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue_button),
                        borderRadius: BorderRadius.circular(32)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blue_button, width: 1.5),
                      borderRadius: BorderRadius.circular(32)),
                    helperText: 'This will be shown to your emergency contacts',
                  )
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Text(hasBeenPressed?"Press END to end tracking" : "Press START to start tracking",
                style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 25,
                    decoration: TextDecoration.none,
                    color: Colors.red,
                    fontWeight: FontWeight.normal)),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isLoading ? CircularProgressIndicator() : Text(''),
                  SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    child: Text(
                      result,
                      style: TextStyle(
                        fontFamily: "SourceSansPro",
                          color: isLink ? link_blue : Colors.red[900],
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: isLink ? lunchUrl : null,
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ ElevatedButton(

            child: Container(
            height: 90,
              width: 90,
              alignment: Alignment.center,
              child: Text('START',
                  style: TextStyle(
                      fontFamily: "SourceSansPro",
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
                onPressed: () {startTracking(); _button_state(true);},
                style: ElevatedButton.styleFrom(
                  primary: blue_button,
                    shape: CircleBorder(),
                    elevation: 7
                ),
              ),
                ElevatedButton(
                  child: Container(
                    height: 90,
                    width: 90,
                    alignment: Alignment.center,
                    child: Text('END',
                        style: TextStyle(
                            fontFamily: "SourceSansPro",
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  onPressed: () {endTracking(); _button_state(false);} ,
                  style: ElevatedButton.styleFrom(
                      primary: blue_button,
                      shape: CircleBorder(),
                      //primary: _hasBeenPressed ? Colors.red : Colors.blueGrey,
                      elevation: 7
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.07),
            Container(
              height: 80,
              width: 220,
              child:
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: blue_button,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0))),
              child: Text('Get Location Link',
                  style: TextStyle(
                      fontFamily: "SourceSansPro",
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              onPressed: shareLink,
            ),),
            SizedBox(height: size.height * 0.02),
            Text("Get your location link and",
                style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: dark_charcoal,
                    fontWeight: FontWeight.normal)),
            Text("share with your loved ones",
                style: TextStyle(
                    fontFamily: "SourceSansPro",
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: dark_charcoal,
                    fontWeight: FontWeight.normal)),
            SizedBox(height: size.height * 0.05)
          ],
        ),
      ),
    );
  }
}
