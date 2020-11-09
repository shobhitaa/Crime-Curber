import 'package:flutter/material.dart';
import 'package:crime_curber/welcome_screen.dart';
import 'package:crime_curber/constants.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:crime_curber/camera.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  try{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  }
  on CameraException catch (e) {
    logError(e.code, e.description);
  }
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: light_gray,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
