import 'package:flutter/material.dart';
import 'package:freeze_new/models/font.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TiltGuide extends StatefulWidget {
  final double defaultTilt;
  final Map? exif;
  const TiltGuide({Key? key, required this.defaultTilt, this.exif})
      : super(key: key);

  @override
  _TiltGuideState createState() => _TiltGuideState();
}

class _TiltGuideState extends State<TiltGuide> {
  String tiltSource = "assets/images/TiltGood.gif";

  String tiltIn = "assets/images/TiltIn.gif";
  String tiltOut = "assets/images/TiltOut.gif";
  String tiltGood = "assets/images/TiltGood.gif";

  String horizionSource = "assets/images/HorizionGood.gif";

  String horizionLeft = "assets/images/HorizionLeft.gif";
  String horizionRight = "assets/images/HorizionRight.gif";
  String horizionGood = "assets/images/HorizionGood.gif";

  @override
  void initState() {
    super.initState();
    if (mounted) {
      accelerometerEvents.listen((AccelerometerEvent e) {
        setState(() {
          if (widget.exif == null) {
            if (e.z > widget.defaultTilt + 0.3) {
              tiltSource = tiltIn;
            } else if (e.z < widget.defaultTilt - 0.3) {
              tiltSource = tiltOut;
            } else {
              tiltSource = tiltGood;
            }
            if (e.x > 0.3) {
              horizionSource = horizionRight;
            } else if (e.x < -0.3) {
              horizionSource = horizionLeft;
            } else {
              horizionSource = horizionGood;
            }
          } else {
            if (e.z > widget.exif!['tilt'] + 0.3) {
              tiltSource = tiltIn;
            } else if (e.z < widget.exif!['tilt'] - 0.3) {
              tiltSource = tiltOut;
            } else {
              tiltSource = tiltGood;
            }
            if (e.x > 0.3) {
              horizionSource = horizionRight;
            } else if (e.x < -0.3) {
              horizionSource = horizionLeft;
            } else {
              horizionSource = horizionGood;
            }
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              horizionSource,
              height: 50,
            ),
            const Text("수평계", style: FontKoMgr.Overline)
          ],
        ),
        if (widget.exif != null)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                tiltSource,
                width: 70,
              ),
              const Text("기울기", style: FontKoMgr.Overline)
            ],
          ),
      ],
    );
  }
}
