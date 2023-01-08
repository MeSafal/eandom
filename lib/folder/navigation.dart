import 'package:flutter/material.dart';
import 'package:testapp/pages/showres.dart';
import 'package:testapp/Home/home.dart';
import 'package:testapp/pages/splash.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class NavigationPage extends StatefulWidget {
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentNum = 0;

  List pages = [
    ApiCall(),
    HomePage(),
    SplashScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentNum],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (value) {
          setState(() {
            currentNum = value;
          });
        },
        index: currentNum,
        items: [
          Icon(Icons.list),
          Icon(Icons.description),
          Icon(Icons.radar_rounded),
        ],
      ),
    );
  }
}
