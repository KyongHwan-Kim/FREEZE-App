import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeze/models/color.dart';
import 'package:freeze/models/font.dart';
import 'package:freeze/screens/login.dart';
import 'package:freeze/utilities/utility.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

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
    var duration = Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    final String imageLogoName = 'assets/logo/logo_main.svg';

    return Scaffold(
      backgroundColor: fromHex('#6F22D2'),
      body: Container(
        color: fromHex(GrayScale.Black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 10),
              // alignment: Alignment.center,
              child: SvgPicture.asset(imageLogoName),
            ),
            Container(
              height: 400,
            ),
            Container(
              child:
                  Text("© Copyright 2023, TEAM R", style: FontEnMgr.Overline),
            )
          ],
        ),
      ),
    );
  }
}
