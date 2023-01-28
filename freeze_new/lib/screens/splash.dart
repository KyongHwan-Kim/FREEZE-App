import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/models/font.dart';
import 'package:freeze_new/models/img.dart';
import 'package:freeze_new/screens/login.dart';
import 'package:freeze_new/utilities/utility.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    const duration = Duration(seconds: 10);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fromHex('#6F22D2'),
      body: Container(
        color: fromHex(GrayScale.White),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(left: 10),
              // alignment: Alignment.center,
              child: Image.asset(
                ImgLocale.LogoAnimation,
                height: 200,
              ),
            ),
            Container(
              height: 200,
            ),
            const Text("© Copyright 2023, TEAM R", style: FontEnMgr.Overline),
          ],
        ),
      ),
    );
  }
}
