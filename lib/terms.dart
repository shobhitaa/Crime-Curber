import 'package:flutter/material.dart';

void _TermsOfService(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Terms()));
}

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          color: Colors.white,
        ),
      
      Center(
          child: new Image.asset(
            'assets/images/welc_bg.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
      ),
        new Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text('Terms of Service',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 23
            )),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.grey,
            elevation: 10.0,
          ),),
      ]),
    );
  }
}
