import 'package:flutter/material.dart';
import 'dart:async';

import 'package:free_app/screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.namedRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            "Free",
            style: TextStyle(
                color: Colors.red, fontSize: 50, fontFamily: "LuckiestGuy"),
          ),
        ));
  }
}
