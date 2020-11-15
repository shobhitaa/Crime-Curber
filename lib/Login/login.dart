import 'package:crime_curber/Contacts/addContacts.dart';
import 'package:crime_curber/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:crime_curber/Animation/bottomAnimation.dart';
import 'package:crime_curber/main_screen.dart';
import 'package:crime_curber/terms.dart';
import 'package:crime_curber/privacy.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final _controllerPhone = TextEditingController();
final _controllerCode = TextEditingController();

class _LoginState extends State<Login> {
  bool _validate = false;
  bool _validateCode = false;
  String _verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/welc_bg.png"),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(
                  //   height: height * 0.07,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "CRIME ",
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 32,
                          color: const Color(0xba101010),
                        ),
                      ),
                      Text(
                        "CURBER",
                        style: TextStyle(
                          fontFamily: 'RedHatDisplay',
                          fontSize: 46,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: height * 0.1,
                  // ),
                  phoneTextField(width, height),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.info,
                        color: blue_button,
                        size: height * 0.03,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'We will send',
                            style: TextStyle(color: dark_charcoal)),
                        TextSpan(
                          text: ' One Time Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: dark_charcoal),
                        ),
                        TextSpan(
                            text: ' on \nthis mobile number',
                            style: TextStyle(color: dark_charcoal))
                      ])),
                    ],
                  ),
                  // SizedBox(
                  //   height: height * 0.05,
                  // ),
                  loginBtn(width, height),
                  Text(
                    "By continuing you indicate that you have",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Text(
                    "read and agree to Crime Curber's",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Terms();
                            }));
                          },
                          child: Text(
                            "Terms of Service",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.bold,
                                color: link_blue,
                                decoration: TextDecoration.underline),
                          )),
                      Text(
                        " and ",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PrivacyPolicy();
                            }));
                          },
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.bold,
                                color: link_blue,
                                decoration: TextDecoration.underline),
                          )),
                      Text("."),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    ));
  }

  String validatePhone(String phone) {
    if (!(phone.length == 10) && phone.isNotEmpty) {
      return "Invalid Phone Number length";
    }
    return null;
  }

  String validateCode(String code) {
    if (!(code.length == 6) && code.isNotEmpty) {
      return "Invalid Code length";
    }
    return null;
  }

  verificationCompleted() {
    return (AuthCredential credential) async {
      await _auth.signInWithCredential(credential).then((AuthResult value) {
        if (value.user != null) {
          Navigator.pop(context);
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => MainView(
                        user: value.user,
                      )));
        }
      });
    };
  }

  verificationFailed() {
    return (AuthException exception) {
      Toast.show('Verification Failed: ${exception.code}', context,
          backgroundColor: Colors.red,
          duration: 3,
          backgroundRadius: 5,
          gravity: Toast.BOTTOM);
    };
  }

  codeSent() {
    return (String verificationID, [int forceResendingToken]) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: Text('Enter 6-Digit Code'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                    controller: _controllerCode,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      errorText: validateCode(_controllerCode.text),
                      hintText: 'Enter Code',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.red,
                        size: MediaQuery.of(context).size.height * 0.03,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        'Wait for Automatic Detection!',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.red,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.017),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .05),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.lightBlue,
                      onPressed: () async {
                        setState(() {
                          _controllerCode.text.isEmpty
                              ? _validateCode = true
                              : _validateCode = false;
                        });
                        _auth.currentUser().then((user) {
                          if (user != null) {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainView(
                                          user: user,
                                        )));
                          } else {
                            _verifyCode();
                          }
                        });
                        _controllerCode.clear();
                      },
                    ),
                  )
                ],
              ),
            );
          });
      _verificationId = verificationID;
    };
  }

  codeAutoRetrievalTimeout() {
    return (String verificationID) {
      _verificationId = verificationID;
    };
  }

  Future<void> _verifyPhoneNumber(String phone) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted(),
      verificationFailed: verificationFailed(),
      codeSent: codeSent(),
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout(),
    );
  }

  Future<void> _verifyCode() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: _controllerCode.text);
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    if (user != null) {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainView(
                    user: user,
                  )));
    }
  }

  Widget phoneTextField(double mediaQueryWidth, double mediaQueryHeight) {
    return Container(
      width: mediaQueryWidth * 0.9,
      child: TextField(
          controller: _controllerPhone,
          style: TextStyle(
              color: dark_charcoal, fontSize: mediaQueryHeight * 0.023),
          keyboardType: TextInputType.phone,
          autofocus: false,
          cursorColor: dark_charcoal,
          maxLength: 10,
          decoration: InputDecoration(
              errorText: validatePhone(_controllerPhone.text),
              counterStyle: TextStyle(color: dark_charcoal),
              prefixIcon: WidgetAnimator(
                Icon(
                  Icons.phone,
                  color: dark_charcoal,
                  size: mediaQueryHeight * 0.03,
                ),
              ),
              prefix: Text(
                '+91',
                style: TextStyle(fontSize: mediaQueryHeight * 0.023),
              ),
              prefixStyle: TextStyle(color: dark_charcoal),
              labelText: 'Phone Number',
              labelStyle: TextStyle(color: dark_charcoal),
              hintStyle: TextStyle(color: dark_charcoal),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: dark_charcoal),
                  borderRadius: BorderRadius.circular(32)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(32)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(32)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: dark_charcoal),
                  borderRadius: BorderRadius.circular(32)))),
    );
  }

  Widget loginBtn(double mediaQueryWidth, double mediaQueryHeight) => Container(
        width: mediaQueryWidth * 0.5,
        height: mediaQueryHeight * 0.07,
        child: ElevatedButton(
          //splashColor: Colors.blue,
          style: ElevatedButton.styleFrom(
              primary: blue_button,
              elevation: 7,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),
          onPressed: () async {
            setState(() {
              _controllerPhone.text.isEmpty
                  ? _validate = true
                  : _validate = false;
            });
            final phoneNumber = "+91" + _controllerPhone.text.trim();
            _verifyPhoneNumber(phoneNumber);
            _controllerPhone.clear();
          },
          child: WidgetAnimator(
            Text(
              "Login",
              style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
}
