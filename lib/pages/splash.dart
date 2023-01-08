import 'dart:async';
// import 'dart:ffi';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:testapp/pages/loginpage.dart';

var count = 0;

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var spinkit;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Image.asset(
            'images/img.png',
            width: 147,
            height: 135,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Please wait we are working to \n build a best platform for you.....',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: 90,
              child: Container(
                color: Colors.transparent,
                child: spinkit = SpinKitPianoWave(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Text(
            '          Loading.........',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
