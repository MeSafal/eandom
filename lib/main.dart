import 'package:flutter/material.dart';
// import 'package:testapp/folder/loginmodel.dart';
// import 'package:testapp/pages/loginpage.dart';
// import 'package:testapp/pages/signin.dart';
import 'pages/splash.dart';
// import 'package:testapp/Home/home.dart';
// import 'package:testapp/pages/splash.dart';
// import 'package:testapp/pages/showres.dart';
// import 'package:testapp/folder/navigation.dart' as nv;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.red,
        // body: nv.NavigationPage(),
        body: SplashScreen(),
      ),
    );
  }
}
