import 'package:flutter/material.dart';
import 'package:crime_curber/constants.dart';


class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Text("Sign Up",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 32,
                    color: const Color(0xba101010),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold)),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',),
            ),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',)),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email ID',)),
            TextField(obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',)),
            TextField(obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',)
            ),
            ElevatedButton(onPressed: () {}, child: Text("Register"))],
        )
    );
  }
}
