
import 'package:crime_curber/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:sms_maintained/sms.dart';
import 'package:toast/toast.dart';
import 'package:crime_curber/SOS/locationOnMap.dart';

class SOS extends StatefulWidget {
  final FirebaseUser user;
  SOS({this.user});
  @override
  _SOSState createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  final FirebaseDatabase database = new FirebaseDatabase();

  void sendSMS(String number, String msgText) {
    SmsMessage msg = new SmsMessage(number, msgText);
    final SmsSender sender = new SmsSender();
    msg.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sending) {
        return Toast.show('Sending Alert...', context,
            duration: 1, backgroundColor: Colors.blue, backgroundRadius: 5);
      } else if (state == SmsMessageState.Sent) {
        return Toast.show('Alert Sent Successfully!', context,
            duration: 3, backgroundColor: Colors.green, backgroundRadius: 5);
      } else if (state == SmsMessageState.Fail) {
        return Toast.show(
            'Failure! Check your credits & Network Signals!', context,
            duration: 5, backgroundColor: Colors.red, backgroundRadius: 5);
      } else {
        return Toast.show('Failed to send SMS. Try Again!', context,
            duration: 5, backgroundColor: Colors.red, backgroundRadius: 5);
      }
    });
    // sender.sendSms(msg);
  }

  sendAlertSMS() async {
    List<String> recipients = [];
    var db =
        FirebaseDatabase.instance.reference().child(widget.user.phoneNumber);

    LocationData myLocation;
    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
      var currentLocation = myLocation;
      setState(() {
        db.once().then((DataSnapshot snapshot) async {
          Map<dynamic, dynamic> values = snapshot.value;

          if (snapshot.value == null) {
            return Toast.show('No Contacts Found!', context,
                backgroundColor: Colors.red,
                backgroundRadius: 5,
                duration: 3,
                gravity: Toast.CENTER);
          } else {
            values.forEach((key, values) {
              recipients.add(values["phone"]);
            });

            var coordinates = Coordinates(
                currentLocation.latitude, currentLocation.longitude);
            var addresses =
                await Geocoder.local.findAddressesFromCoordinates(coordinates);
            var first = addresses.first;
            String link =
                "http://maps.google.com/?q=${currentLocation.latitude},${currentLocation.longitude}";
            for (int i = 0; i < recipients.length; i++) {
              sendSMS(recipients[i],link);
            }
          }
        });
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Please grant permission';
        print('Error due to Denied: $error');
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied- please enable it from app settings';
        print("Error due to not Asking: $error");
      }
      myLocation = null;
    }
  }

  //   Future<void> _getInitialLocation() async {
  //   var db =
  //       FirebaseDatabase.instance.reference().child(widget.user.phoneNumber);

  //   LocationData myLocation;
  //   String error;
  //   Location location = new Location();
  //   try {
  //     myLocation = await location.getLocation();
  //     var currentLocation = myLocation;
  //     setState(() {
  //       var initLocLat = currentLocation.latitude;
  //       var initLocLong = currentLocation.longitude;
  //       db.once().then((DataSnapshot snapshot) {
  //         if (snapshot.value == null) {
  //           return Toast.show('No Contacts Found!', context,
  //               backgroundColor: Colors.red,
  //               backgroundRadius: 5,
  //               duration: 3,
  //               gravity: Toast.CENTER);
  //         } else {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => LocationOnMap(
  //                         user: widget.user,
  //                         initLat: initLocLat,
  //                         initLong: initLocLong,
  //                       )));
  //         }
  //       });
  //     });
  //   } on PlatformException catch (e) {
  //     if (e.code == 'PERMISSION_DENIED') {
  //       error = 'Please grant permission';
  //       print(error);
  //     }
  //     if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {

  //      error = 'Permission denied- please enable it from app settings';
  //       print(error);
  //     }
  //     myLocation = null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
   sendAlertSMS();
   return MainView();
  }
}