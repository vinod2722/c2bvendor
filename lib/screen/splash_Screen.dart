import 'dart:async';

import 'package:flutter/material.dart';

import 'onBoard_screen.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoarding_Screen_Page()));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardingScreenPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset("assets/images/app_logo.png"),
      ),
    );
  }
}
