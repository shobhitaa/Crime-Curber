import 'package:flutter/material.dart';
import 'package:crime_curber/constants.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("Login",
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 32,
                color: const Color(0xba101010),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold)),

        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email ID',)),
      TextField(obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',)),

        ElevatedButton(onPressed: () {}, child: Text("Login"))],
    ));
  }
}
