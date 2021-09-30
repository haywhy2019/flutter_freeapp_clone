import 'package:flutter/material.dart';
import 'package:free_app/screens/ReadScreen.dart';
import 'package:free_app/screens/listenScreen.dart';
import 'package:free_app/screens/playScreen.dart';
import 'package:free_app/screens/watchScreen.dart';
import 'package:provider/provider.dart';
import "../provider/sectionProvider.dart";

class HomeScreen extends StatefulWidget {
  static const namedRoute = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    WatchScreen(),
    ListenScreen(),
    ReadScreen(),
    PlayScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (ctx) => ProvideSection())
        ChangeNotifierProvider.value(
          value: ProvideSection(),
        )
      ],
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                activeIcon: Text(
                  "Watch",
                  style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red),
                ),
                icon: Text(
                  "Watch",
                  style: TextStyle(color: Colors.white),
                ),
                label: "listen"),
            BottomNavigationBarItem(
                activeIcon: Text(
                  "Listen",
                  style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red),
                ),
                icon: Text(
                  "Listen",
                  style: TextStyle(color: Colors.white),
                ),
                label: "listen"),
            BottomNavigationBarItem(
                activeIcon: Text(
                  "Read",
                  style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red),
                ),
                icon: Text(
                  "Read",
                  style: TextStyle(color: Colors.white),
                ),
                label: "listen"),
            BottomNavigationBarItem(
                activeIcon: Text(
                  "Play",
                  style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red),
                ),
                icon: Text(
                  "Play",
                  style: TextStyle(color: Colors.white),
                ),
                label: "listen")
          ],
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.red,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
