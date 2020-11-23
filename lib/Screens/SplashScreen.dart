import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/Screens/landingPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: LandingPage(),
                type: PageTransitionType.rightToLeftWithFade)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Expanded(
              //     flex: 4,
              //     child: SizedBox(
              //         height: 300, child: Image.asset("images/logo.png"))),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 18.0),
              //   child: Expanded(
              //     flex: 1,
              //     child: Align(
              //         alignment: FractionalOffset.bottomCenter,
              //         child: CircularProgressIndicator()),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
