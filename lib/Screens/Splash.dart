import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keyboard/Screens/Onboarding.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/splash.png")],
          ),
        ),
      ),
    );
  }
}
