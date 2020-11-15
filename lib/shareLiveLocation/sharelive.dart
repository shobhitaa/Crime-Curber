import 'package:flutter/material.dart';
import 'package:hypertrack_plugin/hypertrack.dart';
import 'package:crime_curber/shareLiveLocation/networking.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
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
                        color: isLink ? Colors.blue[900] : Colors.red[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: isLink ? lunchUrl : null,
                ),
              ],
            ),
          ),
          FlatButton(
            child: Text(
              'Strat Tracking my Location',
            ),
            onPressed: startTracking,
          ),
          FlatButton(
            child: Text('get my Location Link'),
            onPressed: shareLink,
          ),
          FlatButton(
            child: Text('End Tracking my Location'),
            onPressed: endTracking,
          ),
        ],
      ),
    );
  }
}
