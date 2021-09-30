import 'package:flutter/material.dart';
import 'package:free_app/widgets/appBarWidget.dart';

class WatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBarWidget(
        "Watch",
        "SAMSUNG TV Plus",
        Icon(Icons.search),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Can't connect",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Text(
              "Samsung Free isn't available in your current location",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
