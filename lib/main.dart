import 'package:flutter/material.dart';
import 'package:free_app/screens/homeScreen.dart';
import 'package:free_app/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: SplashScreen(),
      routes: {HomeScreen.namedRoute: (ctx) => HomeScreen()},
    );
  }
}
